package movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieDAO;
import movie.dao.ReviewDAO;
import movie.dto.MovieDTO;
import movie.dto.ReviewDTO;

@WebServlet("/Movie/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();
	private ReviewDAO rdao = new ReviewDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("list")) {
			
			List<MovieDTO> list = dao.movieList();
			request.setAttribute("list", list);
			
			String page = "/movie/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("info")) {
			System.out.println("컨트롤러 info"+request.getParameter("moviecode"));
			String moviecode = request.getParameter("moviecode");
			MovieDTO dto = dao.movieInfo(moviecode);
			request.setAttribute("dto", dto);
			
			String page = "/movie/info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("reply")) {
			
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
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
