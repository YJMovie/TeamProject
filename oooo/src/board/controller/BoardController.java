package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;


@WebServlet("/Board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao = new BoardDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("home.do")) {
			System.out.println("홈페이지이동...");
			
			
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = 7; //총 레코드 수 계산
			int page_scale = 5;
			int totPage = (int)Math.ceil(count*1.0/page_scale);
			
			int start = (curPage-1)*page_scale+1;
			int end = start+page_scale-1;
			
			BoardDAO dao = new BoardDAO();
			List<BoardDTO> list = dao.list_random(start,end);
			request.setAttribute("list", list);
			
			System.out.println("현재페이지:"+curPage);
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("pageStart", start);
			request.setAttribute("pageEnd", end);
			
			String page = "/main/home.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		if (url.contains("list.do")) {
			
			BoardDAO dao = new BoardDAO();
			List<BoardDTO> list = dao.list();
			request.setAttribute("list", list);
			
			String page = "/board/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("info.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDTO dto = dao.info(num);
			request.setAttribute("dto", dto);
			
			String page = "/board/info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("review_write.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			System.out.println("xxxxxxxx"+num);
			
			request.setAttribute("num", num);
			String page = "/board/review_write.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("review_insert.do")) {
			System.out.println("리뷰작성완료...");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
