package home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieDAO;
import movie.dto.MovieDTO;

@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MovieDAO dao = new MovieDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String userid = (String) request.getAttribute("sId");
		System.out.println("아이디는 : " + userid);
		int curPage = 1;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int count = dao.movieCount(); //총 레코드 수 계산
		int page_scale = 5;
		int totPage = (int)Math.ceil(count*1.0/page_scale);
		
		int start = (curPage-1)*page_scale+1;
		int end = start+page_scale-1;
		// 개봉순으로정렬
		List<MovieDTO> listOpen = dao.movieListOpen(start, end);
		request.setAttribute("listOpen", listOpen);
		// 랜덤순으로 정렬
		List<MovieDTO> listRandom = dao.movieRandom(start, end);
		request.setAttribute("listRandom", listRandom);
		// 평점순으로 정렬
		List<MovieDTO> listScore = dao.movieListScore(start,end);
		request.setAttribute("listScore", listScore);
		
		int randomGenre = (int) (Math.random() * 7) + 1;
		String selectGenre = "000";
		
		String selectGenre2 = Integer.toString(randomGenre);
		selectGenre = selectGenre.concat(selectGenre2);		 
		
		String[] GenreList = {"액션","멜로/로맨스","공포","판타지","SF","스릴러","드라마"};
		
		String showGenre = GenreList[randomGenre-1];
		List<MovieDTO> listGenre = dao.movieListGenre(selectGenre);
		System.out.println(listGenre);
		
		if(userid!=null) {

	         //로그인 여부를 위해 id 정보를 보냄
	         request.setAttribute("userid", userid);
	         
	         //유저가 선호하는 영화 목록 생성
	         List<MovieDTO> userGenreList = dao.movieListUserGenre(userid);
	         
	         // 없을 경우 null을 전송
	         if(userGenreList==null)
	            request.setAttribute("userGenreList", null);
	         else
	            request.setAttribute("userGenreList", userGenreList);
	         
	         //유저가 선호하는 영화들 중 랜덤으로 하나의 영화를 가져와 해당 영화의 장르를 가져옴
	         String findWhatGenreSelected = dao.findWhatGenreSelected(userid);
	         
	         //선호하는 장르가 있을 때는 리스트를 받아와서 전송 없을 시엔 null 전송
	         if(findWhatGenreSelected !=null) {
	            List<MovieDTO> userRecommendGenreList = dao.userRecommendGenreList(findWhatGenreSelected);
	            
	            String findWhatGenreSelectedLastWord = findWhatGenreSelected.substring(findWhatGenreSelected.length()-1, findWhatGenreSelected.length());
	            int IntegerfindWhatGenreSelectedLastWord = Integer.parseInt(findWhatGenreSelectedLastWord);
	            
	            //선호하는 장르코드를 리스트에 담긴 장르명으로 변경
	            findWhatGenreSelected = GenreList[IntegerfindWhatGenreSelectedLastWord-1];      
	            
	            request.setAttribute("findWhatGenreSelected", findWhatGenreSelected);
	            request.setAttribute("userRecommendGenreList", userRecommendGenreList);
	         }
	         else {
	            request.setAttribute("findWhatGenreSelected", findWhatGenreSelected);
	         }
	         
	      }
	      
		request.setAttribute("showGenre", showGenre);
		request.setAttribute("listGenre", listGenre);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pageStart", start);
		request.setAttribute("pageEnd", end);
		
		
		String page = "/home/home.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
