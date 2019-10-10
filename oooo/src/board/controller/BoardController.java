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
import review.dao.ReviewDAO;
import review.dto.ReviewDTO;


@WebServlet("/Board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao = new BoardDAO();
	private ReviewDAO rdao = new ReviewDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("home.do")) {
			System.out.println("홈페이지이동...");
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = dao.recordCount(); //총 레코드 수 계산
			int page_scale = 5;
			int totPage = (int)Math.ceil(count*1.0/page_scale);
			
			int start = (curPage-1)*page_scale+1;
			int end = start+page_scale-1;
			
			BoardDAO dao = new BoardDAO();
			List<BoardDTO> listRandom = dao.list_random(start,end);
			request.setAttribute("listRandom", listRandom);
			
			List<BoardDTO> listMark = dao.list_mark(start, end);
			request.setAttribute("listMark", listMark);
			
			System.out.println("현재페이지:"+curPage);
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("totPage", totPage);
			request.setAttribute("pageStart", start);
			request.setAttribute("pageEnd", end);
			
			String page = "/main/home.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		if (url.contains("list.do")) {
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = dao.recordCount();
			int page_scale = 16;
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
			
			int category = 1;
			if (request.getParameter("category") != null) {
				category = Integer.parseInt(request.getParameter("category"));
			}
			if (category == 1) {
				System.out.println("평점순...");
				List<BoardDTO> list = dao.list("mark",start,end);
				request.setAttribute("list", list);
			} else if (category == 2) {
				System.out.println("리뷰순...");
				List<BoardDTO> list = dao.list("totreview",start,end);
				request.setAttribute("list", list);
			} else {
				System.out.println("예매율...");
				
			}
			request.setAttribute("category", category);
			
			String page = "/board/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("info.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDTO dto = dao.info(num);
			request.setAttribute("dto", dto);
			
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			request.setAttribute("curPage", curPage);
			
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
			String writer = request.getParameter("writer");
			double rmark = Double.parseDouble(request.getParameter("rmark"));
			String rcomment = request.getParameter("rcomment");
			int movie_num = Integer.parseInt(request.getParameter("movie_num"));
			
			System.out.println("wr:"+writer+",mk:"+rmark+",comm:"+rcomment+",m_n:"+movie_num);
			
			ReviewDTO rdto = new ReviewDTO();
			rdto.setMovie_num(movie_num);
			rdto.setWriter(writer);
			rdto.setRmark(rmark);
			rdto.setRcomment(rcomment);
			System.out.println(rdto);
			
			rdao.reviewInsert(rdto);
			
			String page = "info.do?num="+movie_num+"&curPage=1";
			response.sendRedirect(page);
		} else if (url.contains("review_reply.do")) {
			System.out.println("리뷰 리스트띄우기");
			int movie_num = Integer.parseInt(request.getParameter("movie_num"));
			request.setAttribute("movie_num", movie_num);
			System.out.println("m_n:"+movie_num);
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = rdao.reviewCount(movie_num); //해당 영화 리뷰 총 레코드 수
			int page_scale = 5;
			int totPage = (int)Math.ceil(count*1.0/page_scale);
			int start = (curPage-1)*page_scale+1;
			int end = start+page_scale-1;
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("totPage", totPage);
			
			int block_scale = 5;
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
			
			List<ReviewDTO> list = rdao.reviewRead(movie_num,start,end);
			request.setAttribute("list", list);
			
			
			String page = "/board/review_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
