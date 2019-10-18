package home.controller;

import java.io.IOException;
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
		
		int curPage = 1;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int count = dao.movieCount(); //총 레코드 수 계산
		int page_scale = 5;
		int totPage = (int)Math.ceil(count*1.0/page_scale);
		
		int start = (curPage-1)*page_scale+1;
		int end = start+page_scale-1;
		
		List<MovieDTO> listRandom = dao.movieRandom(start, end);
		request.setAttribute("listRandom", listRandom);
		
		List<MovieDTO> listScore = dao.movieListScore(start, end);
		request.setAttribute("listScore", listScore);
		
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
