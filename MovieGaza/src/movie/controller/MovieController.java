package movie.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import common.Constants;
import movie.dao.MovieDAO;
import movie.dao.ReviewDAO;
import movie.dto.GenreDTO;
import movie.dto.MovieCodeDTO;
import movie.dto.MovieDTO;
import movie.dto.ReviewDTO;

@WebServlet("/Movie/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();
	private ReviewDAO rdao = new ReviewDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String url = request.getRequestURL().toString();
		if (url.contains("list")) {
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = dao.movieCount();
			System.out.println(count);
			int page_scale = 9;
			int totPage = (int)Math.ceil(count*1.0/page_scale);
			int start = (curPage-1)*page_scale+1;
			int end = start+page_scale-1;
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("totPage", totPage);
			System.out.println("총페이지:"+totPage);
			
			int block_scale = 3;
			int totBlock = (int)Math.ceil(totPage*1.0/block_scale);
			int curBlock = (curPage-1)/block_scale+1;
			int block_start = (curBlock-1)*block_scale+1;
			int block_end = block_start+block_scale-1;
			
			int prev_page = 
					curBlock == 1 ? 1 : (curBlock-1)*block_scale;
			int next_page = 
					curBlock > totBlock ? (curBlock*block_scale) : curBlock*block_scale+1;
			if (block_end>totPage) block_end = totPage;
			if (next_page>=totPage) next_page = totPage;
			
			request.setAttribute("totBlock", totBlock);
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("block_start", block_start);
			request.setAttribute("block_end", block_end);
			request.setAttribute("prev_page", prev_page);
			request.setAttribute("next_page", next_page);
			System.out.println("총 블록:"+totBlock);
			System.out.println("현재 블록:"+curBlock);
			
			List<MovieDTO> list = dao.movieList(start, end);
			request.setAttribute("list", list);
			
			String page = "/movie/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("info")) {
			System.out.println("컨트롤러 info"+request.getParameter("moviecode"));
			String moviecode = request.getParameter("moviecode");
			MovieDTO dto = dao.movieInfo(moviecode);
			request.setAttribute("dto", dto);
			
			//grcode를 가져오자
			List<MovieCodeDTO> list = dao.moviecodeGrcode(moviecode);
			String[] genrename = new String[5]; // 가져온 장르 보관할 배열
			for (int i = 0; i < list.size(); i++) {
				String grcode = list.get(i).getGrcode(); //해당영화 grcode, 장르개수만큼
				System.out.println(grcode);
				genrename[i] = dao.movieGenre(grcode);
				request.setAttribute("grname"+(i+1), genrename[i]+"/");
			}
			
			String page = "/movie/info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		//영화 랭킹에서 제목으로 해당 영화 정보를 찾는 과정
	      else if (url.contains("title")) {
	         //인코딩 되어 넘어왔던 한글을 다시 디코딩하여 한글로 변경
	         String movieTitle = URLDecoder.decode(request.getParameter("movieTitle"),"UTF-8");

	         /* System.out.println("제목 : " + movieTitle); */
	         
	         MovieDTO dto = dao.movieTitle(movieTitle);
	         request.setAttribute("dto", dto); 

	         String page = "/movie/info.jsp";
	         RequestDispatcher rd = request.getRequestDispatcher(page);
	         rd.forward(request, response);
	      }
		else if (url.contains("reply")) {
			
			String moviecode = request.getParameter("moviecode");
			List<ReviewDTO> list = rdao.reviewList(moviecode);
			request.setAttribute("list", list);
			
			String page = "/movie/review_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("write")) {
			String moviecode = request.getParameter("moviecode");
			request.setAttribute("moviecode", moviecode);
			
			String page = "/movie/review_write.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("insert")) {
			double r_score = Double.parseDouble( request.getParameter("r_score"));
			String r_comment = request.getParameter("r_comment");
			String r_mvcode = request.getParameter("moviecode");
			String writer = request.getParameter("writer");
			
			ReviewDTO rdto = new ReviewDTO();
			rdto.setR_score(r_score);
			rdto.setR_comment(r_comment);
			rdto.setR_mvcode(r_mvcode);
			rdto.setWriter(writer);
			
			rdao.reviewInsert(rdto);
			
			String page = "Movie/info?moviecode="+r_mvcode;
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		else if (url.contains("rank")) {
	         String croll_url ="https://movie.naver.com/movie/running/current.nhn";   
	         Document doc = null;
	         try {
	            doc = Jsoup.connect(croll_url).get();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }

	         Elements element = doc.select("div.article>div.obj_section");

	         // 영화 정보 여러가지를 하나의 리스트에 보내기 위해 HashMap을 이용하여 보내줌
	         List<Map> movieInfo = new ArrayList<Map>();
	         HashMap<String, String> map = new HashMap<String, String>();

	         // 영화 정보들을 담기 위한 리스트 선언
	         List<String> movieTitle = new ArrayList<String>();
	         List<String> movieReserveURL = new ArrayList<String>();
	         List<String> movieImg = new ArrayList<>();
	         List<String> movieInfomation = new ArrayList<String>();

	         List<String> movieGenreList = new ArrayList<String>();
	         List<String> movieDirectorList = new ArrayList<String>();
	         List<String> movieActorList = new ArrayList<String>();
	         List<String> movieTimeList = new ArrayList<String>();
	         List<String> movieDateList = new ArrayList<String>();
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장         
	         for (Element el : element.select("li>dl>dt>a")) {
	            movieTitle.add(el.text());
	         }
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장
	         for (Element el2 : element.select("li>div.thumb>a>img")) {
	            /* movieImg.add(el2.attr("abs:data-src")); */
	            movieImg.add(el2.getElementsByAttribute("src").attr("src"));
	         }

	         // 영화 예매 주소를 크롤링하여 리스트에 저장
	         for (Element el3 : element.select("li>dl>dd>div.btn_area>a[class=btn_rsv]")) {
	            movieReserveURL.add(el3.attr("abs:href"));
	         }

	         // 영화 기본정보들을 담아옴
	         for (Element el4 : element.select("li>dl>dd>dl[class=info_txt1]")) {
	            movieInfomation.add(el4.text());
	         }

	         // int infochk=1;
	         
	         
	         // 받아온 영화 정보를 subString을 이용하여 사용하고싶은 형태로 분리
	         for (String movieInfomationUnit : movieInfomation) {

	            // '개요'부터 '|'까지의 내용이 장르이므로 해당 내용만 잘라서 movieGenreList에 저장
	            String target = "개요";
	            int target_num = movieInfomationUnit.indexOf(target);
	            String movieGenre;
	            movieGenre = movieInfomationUnit.substring(target_num,
	                  (movieInfomationUnit.substring(target_num).indexOf("|") + target_num));
	            movieGenre = movieGenre.substring(movieGenre.lastIndexOf("요") + 2);
	            movieGenreList.add(movieGenre);
	            // System.out.println(infochk + " 장르 : " + movieGenre);

	            String targetTime = "|";
	            int targetTime_num = movieInfomationUnit.indexOf(targetTime);            
	            String movieTime;
	            movieTime = movieInfomationUnit.substring(targetTime_num-1,
	                  (movieInfomationUnit.substring(targetTime_num).indexOf("분") + targetTime_num+1));
	            movieTime = movieTime.substring(movieTime.lastIndexOf("| ")+1);
	            movieTimeList.add(movieTime);
	            //System.out.println(" 영화시간 : " + movieTime);
	 
	            
	            
	            String targetDate = "분 |";
	            int targetDate_num = movieInfomationUnit.indexOf(targetDate);            
	            String movieDate;
	            movieDate = movieInfomationUnit.substring(targetDate_num+4,
	                  (movieInfomationUnit.substring(targetDate_num).indexOf("봉") + targetDate_num-1));
	            movieDate = movieDate.substring(movieDate.lastIndexOf("분 |")+1);
	            movieDateList.add(movieDate);
	            //System.out.println(" 개봉일 : " + movieDate);
	 
	            
	            
	            // '감독'부터 '출연'까지의 내용이 감독이므로 해당 내용만 잘라서 movieDirector에 저장
	            target = "감독";
	            target_num = movieInfomationUnit.indexOf(target);
	            String movieDirector;
	            // 간혹 출연자가 없는 영화도 있기에 출연이 있을 때만 출연까지, 없을 시엔 감독까지만 잘라서 저장
	            String chkRange = "출연";
	            int chkRange_num = movieInfomationUnit.indexOf(chkRange);
	            if (chkRange_num > 0) {
	               movieDirector = movieInfomationUnit.substring(target_num,
	                     (movieInfomationUnit.substring(target_num).indexOf("출") + target_num));
	               movieDirector = movieDirector.substring(movieDirector.lastIndexOf("독") + 2);
	            } else
	               movieDirector = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("독") + 2);
	            movieDirectorList.add(movieDirector);
	            // System.out.println(infochk + " 감독 : " + movieDirector);

	            // '출연'부터 끝까지 저장하는데 '출연'이 없을 시엔 출연자가 없으므로 공백을 저장
	            String target2 = "출연";
	            int target_num2 = movieInfomationUnit.indexOf(target2);
	            String movieActor;
	            if (target_num2 > 0) {
	               movieActor = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("연") + 1);
	            } else
	               movieActor = " ";
	            movieActorList.add(movieActor);
	            // System.out.println(infochk + " 출연 : " + movieActor);

	            // infochk++;
	            
	            
	         }
	         
	         
	         /*
	          * for (String movieInfomationUnit : movieInfomation) {
	          * System.out.println(movieInfomationUnit); }
	          */
	         
	         
	         /*
	          * for (String movieTitleUnit : movieTitle) {
	          * System.out.println(movieTitleUnit); }
	          */
	          
	         
	         
	         int i = 0;
	         // map에 해당 리스트들을 저장해줌
	         for (Element el : element.select("li>dl>dt>a")) {
	            map = new HashMap<String, String>();
	            map.put("movieTitle", movieTitle.get(i));
	            map.put("movieURL", el.attr("abs:href"));
	            map.put("movieImg", movieImg.get(i));
	            map.put("movieGenre", movieGenreList.get(i));
	            map.put("movieDirector", movieDirectorList.get(i));
	            map.put("movieActor", movieActorList.get(i));
	            map.put("movieTime", movieTimeList.get(i));
	            map.put("movieDate", movieDateList.get(i));
	            
	            // 예매하기가 없는 영화일 시 noSite을 전송하여 사이트가 없는 것을 인식
	            if (i < movieReserveURL.size())
	               map.put("movieReserveURL", movieReserveURL.get(i));
	            else
	               map.put("movieReserveURL", "noSite");
	            movieInfo.add(map);
	            i++;
	         }

	         request.setAttribute("movieInfo", movieInfo);

	         String page = "/movie/rank.jsp";
	         RequestDispatcher rd = request.getRequestDispatcher(page);
	         rd.forward(request, response);
	      }
	      
	      else if (url.contains("date")) {
	         String croll_url ="https://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=open";   
	         Document doc = null;
	         try {
	            doc = Jsoup.connect(croll_url).get();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }

	         Elements element = doc.select("div.article>div.obj_section");

	         // 영화 정보 여러가지를 하나의 리스트에 보내기 위해 HashMap을 이용하여 보내줌
	         List<Map> movieInfo = new ArrayList<Map>();
	         HashMap<String, String> map = new HashMap<String, String>();

	         // 영화 정보들을 담기 위한 리스트 선언
	         List<String> movieTitle = new ArrayList<String>();
	         List<String> movieReserveURL = new ArrayList<String>();
	         List<String> movieImg = new ArrayList<>();
	         List<String> movieInfomation = new ArrayList<String>();

	         List<String> movieGenreList = new ArrayList<String>();
	         List<String> movieDirectorList = new ArrayList<String>();
	         List<String> movieActorList = new ArrayList<String>();
	         List<String> movieTimeList = new ArrayList<String>();
	         List<String> movieDateList = new ArrayList<String>();
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장         
	         for (Element el : element.select("li>dl>dt>a")) {
	            movieTitle.add(el.text());
	         }
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장
	         for (Element el2 : element.select("li>div.thumb>a>img")) {
	            /* movieImg.add(el2.attr("abs:data-src")); */
	            movieImg.add(el2.getElementsByAttribute("src").attr("src"));
	         }

	         // 영화 예매 주소를 크롤링하여 리스트에 저장
	         for (Element el3 : element.select("li>dl>dd>div.btn_area>a[class=btn_rsv]")) {
	            movieReserveURL.add(el3.attr("abs:href"));
	         }

	         // 영화 기본정보들을 담아옴
	         for (Element el4 : element.select("li>dl>dd>dl[class=info_txt1]")) {
	            movieInfomation.add(el4.text());
	         }

	         // int infochk=1;
	         
	         
	         // 받아온 영화 정보를 subString을 이용하여 사용하고싶은 형태로 분리
	         for (String movieInfomationUnit : movieInfomation) {

	            // '개요'부터 '|'까지의 내용이 장르이므로 해당 내용만 잘라서 movieGenreList에 저장
	            String target = "개요";
	            int target_num = movieInfomationUnit.indexOf(target);
	            String movieGenre;
	            movieGenre = movieInfomationUnit.substring(target_num,
	                  (movieInfomationUnit.substring(target_num).indexOf("|") + target_num));
	            movieGenre = movieGenre.substring(movieGenre.lastIndexOf("요") + 2);
	            movieGenreList.add(movieGenre);
	            // System.out.println(infochk + " 장르 : " + movieGenre);

	            String targetTime = "|";
	            int targetTime_num = movieInfomationUnit.indexOf(targetTime);            
	            String movieTime;
	            movieTime = movieInfomationUnit.substring(targetTime_num-1,
	                  (movieInfomationUnit.substring(targetTime_num).indexOf("분") + targetTime_num+1));
	            movieTime = movieTime.substring(movieTime.lastIndexOf("| ")+1);
	            movieTimeList.add(movieTime);
	            //System.out.println(" 영화시간 : " + movieTime);
	 
	            
	            
	            String targetDate = "분 |";
	            int targetDate_num = movieInfomationUnit.indexOf(targetDate);            
	            String movieDate;
	            movieDate = movieInfomationUnit.substring(targetDate_num+4,
	                  (movieInfomationUnit.substring(targetDate_num).indexOf("봉") + targetDate_num-1));
	            movieDate = movieDate.substring(movieDate.lastIndexOf("분 |")+1);
	            movieDateList.add(movieDate);
	            //System.out.println(" 개봉일 : " + movieDate);
	 
	            
	            
	            // '감독'부터 '출연'까지의 내용이 감독이므로 해당 내용만 잘라서 movieDirector에 저장
	            target = "감독";
	            target_num = movieInfomationUnit.indexOf(target);
	            String movieDirector;
	            // 간혹 출연자가 없는 영화도 있기에 출연이 있을 때만 출연까지, 없을 시엔 감독까지만 잘라서 저장
	            String chkRange = "출연";
	            int chkRange_num = movieInfomationUnit.indexOf(chkRange);
	            if (chkRange_num > 0) {
	               movieDirector = movieInfomationUnit.substring(target_num,
	                     (movieInfomationUnit.substring(target_num).indexOf("출") + target_num));
	               movieDirector = movieDirector.substring(movieDirector.lastIndexOf("독") + 2);
	            } else
	               movieDirector = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("독") + 2);
	            movieDirectorList.add(movieDirector);
	            // System.out.println(infochk + " 감독 : " + movieDirector);

	            // '출연'부터 끝까지 저장하는데 '출연'이 없을 시엔 출연자가 없으므로 공백을 저장
	            String target2 = "출연";
	            int target_num2 = movieInfomationUnit.indexOf(target2);
	            String movieActor;
	            if (target_num2 > 0) {
	               movieActor = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("연") + 1);
	            } else
	               movieActor = " ";
	            movieActorList.add(movieActor);
	            // System.out.println(infochk + " 출연 : " + movieActor);

	            // infochk++;
	            
	            
	         }
	         
	         
	         /*
	          * for (String movieInfomationUnit : movieInfomation) {
	          * System.out.println(movieInfomationUnit); }
	          */
	         
	         
	         /*
	          * for (String movieTitleUnit : movieTitle) {
	          * System.out.println(movieTitleUnit); }
	          */
	          
	         
	         
	         int i = 0;
	         // map에 해당 리스트들을 저장해줌
	         for (Element el : element.select("li>dl>dt>a")) {
	            map = new HashMap<String, String>();
	            map.put("movieTitle", movieTitle.get(i));
	            map.put("movieURL", el.attr("abs:href"));
	            map.put("movieImg", movieImg.get(i));
	            map.put("movieGenre", movieGenreList.get(i));
	            map.put("movieDirector", movieDirectorList.get(i));
	            map.put("movieActor", movieActorList.get(i));
	            map.put("movieTime", movieTimeList.get(i));
	            map.put("movieDate", movieDateList.get(i));
	            
	            // 예매하기가 없는 영화일 시 noSite을 전송하여 사이트가 없는 것을 인식
	            if (i < movieReserveURL.size())
	               map.put("movieReserveURL", movieReserveURL.get(i));
	            else
	               map.put("movieReserveURL", "noSite");
	            movieInfo.add(map);
	            i++;
	         }

	         request.setAttribute("movieInfo", movieInfo);

	         String page = "/movie/rank.jsp";
	         RequestDispatcher rd = request.getRequestDispatcher(page);
	         rd.forward(request, response);
	      }

	      
	      else if (url.contains("stars")) {
	         String croll_url ="https://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=point";   
	         Document doc = null;
	         try {
	            doc = Jsoup.connect(croll_url).get();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }

	         Elements element = doc.select("div.article>div.obj_section");

	         // 영화 정보 여러가지를 하나의 리스트에 보내기 위해 HashMap을 이용하여 보내줌
	         List<Map> movieInfo = new ArrayList<Map>();
	         HashMap<String, String> map = new HashMap<String, String>();

	         // 영화 정보들을 담기 위한 리스트 선언
	         List<String> movieTitle = new ArrayList<String>();
	         List<String> movieReserveURL = new ArrayList<String>();
	         List<String> movieImg = new ArrayList<>();
	         List<String> movieInfomation = new ArrayList<String>();

	         List<String> movieGenreList = new ArrayList<String>();
	         List<String> movieDirectorList = new ArrayList<String>();
	         List<String> movieActorList = new ArrayList<String>();
	         List<String> movieTimeList = new ArrayList<String>();
	         List<String> movieDateList = new ArrayList<String>();
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장         
	         for (Element el : element.select("li>dl>dt>a")) {
	            movieTitle.add(el.text());
	         }
	         
	         // 영화 이미지 주소를 크롤링하여 리스트에 저장
	         for (Element el2 : element.select("li>div.thumb>a>img")) {
	            /* movieImg.add(el2.attr("abs:data-src")); */
	            movieImg.add(el2.getElementsByAttribute("src").attr("src"));
	         }

	         // 영화 예매 주소를 크롤링하여 리스트에 저장
	         for (Element el3 : element.select("li>dl>dd>div.btn_area>a[class=btn_rsv]")) {
	            movieReserveURL.add(el3.attr("abs:href"));
	         }

	         // 영화 기본정보들을 담아옴
	         for (Element el4 : element.select("li>dl>dd>dl[class=info_txt1]")) {
	            movieInfomation.add(el4.text());
	         }

	         // int infochk=1;
	         
	         
	         // 받아온 영화 정보를 subString을 이용하여 사용하고싶은 형태로 분리
	         for (String movieInfomationUnit : movieInfomation) {

	            // '개요'부터 '|'까지의 내용이 장르이므로 해당 내용만 잘라서 movieGenreList에 저장
	            String target = "개요";
	            int target_num = movieInfomationUnit.indexOf(target);
	            String movieGenre;
	            movieGenre = movieInfomationUnit.substring(target_num,
	                  (movieInfomationUnit.substring(target_num).indexOf("|") + target_num));
	            movieGenre = movieGenre.substring(movieGenre.lastIndexOf("요") + 2);
	            movieGenreList.add(movieGenre);
	            // System.out.println(infochk + " 장르 : " + movieGenre);

	            String targetTime = "|";
	            int targetTime_num = movieInfomationUnit.indexOf(targetTime);            
	            String movieTime;
	            movieTime = movieInfomationUnit.substring(targetTime_num-1,
	                  (movieInfomationUnit.substring(targetTime_num).indexOf("분") + targetTime_num+1));
	            movieTime = movieTime.substring(movieTime.lastIndexOf("| ")+1);
	            movieTimeList.add(movieTime);
	            //System.out.println(" 영화시간 : " + movieTime);
	 
	            
	            
	            String targetDate = "분 |";
	            int targetDate_num = movieInfomationUnit.indexOf(targetDate);            
	            String movieDate;
	            movieDate = movieInfomationUnit.substring(targetDate_num+4,
	                  (movieInfomationUnit.substring(targetDate_num).indexOf("봉") + targetDate_num-1));
	            movieDate = movieDate.substring(movieDate.lastIndexOf("분 |")+1);
	            movieDateList.add(movieDate);
	            //System.out.println(" 개봉일 : " + movieDate);
	 
	            
	            
	            // '감독'부터 '출연'까지의 내용이 감독이므로 해당 내용만 잘라서 movieDirector에 저장
	            target = "감독";
	            target_num = movieInfomationUnit.indexOf(target);
	            String movieDirector;
	            // 간혹 출연자가 없는 영화도 있기에 출연이 있을 때만 출연까지, 없을 시엔 감독까지만 잘라서 저장
	            String chkRange = "출연";
	            int chkRange_num = movieInfomationUnit.indexOf(chkRange);
	            if (chkRange_num > 0) {
	               movieDirector = movieInfomationUnit.substring(target_num,
	                     (movieInfomationUnit.substring(target_num).indexOf("출") + target_num));
	               movieDirector = movieDirector.substring(movieDirector.lastIndexOf("독") + 2);
	            } else
	               movieDirector = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("독") + 2);
	            movieDirectorList.add(movieDirector);
	            // System.out.println(infochk + " 감독 : " + movieDirector);

	            // '출연'부터 끝까지 저장하는데 '출연'이 없을 시엔 출연자가 없으므로 공백을 저장
	            String target2 = "출연";
	            int target_num2 = movieInfomationUnit.indexOf(target2);
	            String movieActor;
	            if (target_num2 > 0) {
	               movieActor = movieInfomationUnit.substring(movieInfomationUnit.lastIndexOf("연") + 1);
	            } else
	               movieActor = " ";
	            movieActorList.add(movieActor);
	            // System.out.println(infochk + " 출연 : " + movieActor);

	            // infochk++;
	            
	            
	         }
	         
	         
	         /*
	          * for (String movieInfomationUnit : movieInfomation) {
	          * System.out.println(movieInfomationUnit); }
	          */
	         
	         
	         /*
	          * for (String movieTitleUnit : movieTitle) {
	          * System.out.println(movieTitleUnit); }
	          */
	          
	         
	         
	         int i = 0;
	         // map에 해당 리스트들을 저장해줌
	         for (Element el : element.select("li>dl>dt>a")) {
	            map = new HashMap<String, String>();
	            map.put("movieTitle", movieTitle.get(i));
	            map.put("movieURL", el.attr("abs:href"));
	            map.put("movieImg", movieImg.get(i));
	            map.put("movieGenre", movieGenreList.get(i));
	            map.put("movieDirector", movieDirectorList.get(i));
	            map.put("movieActor", movieActorList.get(i));
	            map.put("movieTime", movieTimeList.get(i));
	            map.put("movieDate", movieDateList.get(i));
	            
	            // 예매하기가 없는 영화일 시 noSite을 전송하여 사이트가 없는 것을 인식
	            if (i < movieReserveURL.size())
	               map.put("movieReserveURL", movieReserveURL.get(i));
	            else
	               map.put("movieReserveURL", "noSite");
	            movieInfo.add(map);
	            i++;
	         }

	         request.setAttribute("movieInfo", movieInfo);

	         String page = "/movie/rank.jsp";
	         RequestDispatcher rd = request.getRequestDispatcher(page);
	         rd.forward(request, response);
	      }
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
