package search.controller;

import java.io.IOException;
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

import movie.dao.MovieDAO;
import movie.dto.MovieCodeDTO;
import movie.dto.MovieDTO;


@WebServlet("/Search/*")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("list")) {
			String keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = dao.movieCount();
			System.out.println(count);
			int page_scale = 5;
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
			
			List<MovieDTO> list = dao.movieSearch(keyword,start,end);
			
			// 영화별 장르를 리스트로 주기. 임의의dto를 map으로 만들고 map타입 list를 주어서 setattribute
	         List<Map<String, Object>> maplist = new ArrayList<Map<String,Object>>();
	         String[] genrename = new String[list.size()];
	         for (int i = 0; i < genrename.length; i++) {
	            genrename[i] = "";
	         }
	         for (int i = 0; i < list.size(); i++) {
	            String moviegenre = "";
	            Map<String, Object> map = new HashMap<String, Object>();
	            map.put("moviecode", list.get(i).getMoviecode());
	            map.put("title", list.get(i).getTitle());
	            map.put("score", list.get(i).getScore());
	            map.put("postfname", list.get(i).getPostfname());
	            map.put("open",list.get(i).getOpen());
	            List<MovieCodeDTO> grlist = dao.moviecodeGrcode(list.get(i).getMoviecode());
	            for (int j = 0; j < genrename.length; j++) {
	               
	               try {
	                  genrename[j] = dao.movieGenre(grlist.get(j).getGrcode())+"/";
	               } catch (Exception e) {
	                  // TODO: handle exception
	                  continue;
	               }
	               moviegenre += genrename[j];
	            }
	            System.out.println(moviegenre);
	            map.put("moviegenre", moviegenre);
	            maplist.add(map);
	         }
	         
	         request.setAttribute("list", maplist);
			
			
			String page = "/home/search.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
