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

@WebServlet("/Search/*")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao = new BoardDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		System.out.println(url);
		if (url.contains("list.do")) {
			
			String keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}

			int count = dao.TotalSearchCount(keyword); //총 레코드 수 계산
			int page_scale = 5;
			int totPage = (int)Math.ceil(count*1.0/page_scale);
			int start = (curPage-1)*page_scale+1;
			int end = start+page_scale-1;
			
			request.setAttribute("curPage", curPage);
			
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
			
			
			List<BoardDTO> list = dao.searchList(keyword,start,end);
			
			request.setAttribute("list", list);
			
			String page = "/main/search.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
