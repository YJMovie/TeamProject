package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import member.dao.MemberDAO;
import member.dto.MemberDTO;
import movie.dao.MovieDAO;
import movie.dto.MovieCodeDTO;
import movie.dto.MovieDTO;


@WebServlet("/Admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("main")) {
			String page = "/admin/main.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		if (url.contains("addmovie")) {
			String mvcodeMax = dao.moviecodeMax();
			request.setAttribute("mvcodeMax", mvcodeMax);
			String page = "/admin/addmovie.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("insert")) {
			MovieDTO dto = new MovieDTO();
			
//			String moviecode = request.getParameter("moviecode");
//			String title = request.getParameter("title");
//			String postfname = request.getParameter("postfname");
//			double score = Double.parseDouble(request.getParameter("score"));
//			Date open = Date.valueOf(request.getParameter("open"));
//			System.out.println(open);
//			String lines = request.getParameter("lines");
//			System.out.println(moviecode);
//			
//			
//			dto.setMoviecode(moviecode);
//			dto.setTitle(title);
//			dto.setScore(score);
//			dto.setOpen(open);
//			dto.setLines(lines);
			
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			
			MultipartRequest multi = new MultipartRequest(
					request, 
					Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,
					"utf-8",
					new DefaultFileRenamePolicy());
			
			String postfname = "";
			int filesize = 0;
			
			try {
				Enumeration files = multi.getFileNames();
				while (files.hasMoreElements()) {
					String file1 = (String) files.nextElement();
					
					postfname = multi.getFilesystemName(file1);
					System.out.println("filename:"+postfname);
					
					File f1 = multi.getFile(file1);
					if (f1 != null) {
						filesize = (int) f1.length();
						System.out.println("filesize:"+filesize);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			String moviecode = multi.getParameter("moviecode");
			String title = multi.getParameter("title");
			Date open = Date.valueOf(multi.getParameter("open"));
			System.out.println(open);
			String lines = multi.getParameter("lines");
			System.out.println(moviecode);
			
			
			dto.setMoviecode(moviecode);
			dto.setTitle(title);
			dto.setPostfname(postfname);
			dto.setOpen(open);
			dto.setLines(lines);
			
			dao.movieInsert(dto);
			System.out.println("movieInsert 완료");
			
			MovieCodeDTO cdto = new MovieCodeDTO();
			List<MovieCodeDTO> codelist = new ArrayList<MovieCodeDTO>();
			int i=0;
			for (i = 0; i < 5; i++) { //i최대값은 장르,인물 테이블 총 레코드가 최대값인것
				String grcode = multi.getParameter("grcode"+(i+1));
				String pscodeA = multi.getParameter("pscodeA"+(i+1));
				
				if (grcode == null && pscodeA == null) {
					continue;
				}
				cdto.setMvcode(moviecode);
				cdto.setGrcode(grcode);
				cdto.setPscode(pscodeA);
				System.out.println(cdto);
				dao.moviecodeInsert(cdto);
			}
			for (i = 0; i < 5; i++) { //i최대값은 장르,인물 테이블 총 레코드가 최대값인것
				String grcode = multi.getParameter("grcode"+(i+1));
				String pscodeB = multi.getParameter("pscodeB"+(i+1));
				if (grcode == null && pscodeB == null) {
					continue;
				}
				cdto.setMvcode(moviecode);
				cdto.setGrcode(grcode);
				cdto.setPscode(pscodeB);
				System.out.println(cdto);
				dao.moviecodeInsert(cdto);
			}
			
			String page = "/admin/main.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if (url.contains("member_list")) {
			System.out.println("list.do 처리중");
			MemberDAO dao = new MemberDAO();
			
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			int count = dao.recordCount();
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
			
			List<MemberDTO> list = dao.list(start,end);  //이부분이 문제인듯
			System.out.println("jmember.do Ok");
			request.setAttribute("list", list);
			System.out.println("jmember.do Ok");
			
			request.setAttribute("totPage", totPage);
			
			String page = "/admin/memlist.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("movie_list")) {
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
			
			List<MovieDTO> list = dao.movieList(start, end);
			request.setAttribute("list", list);
			
			String page = "/admin/movielist.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("movie_delete")) {
			String moviecode = request.getParameter("moviecode");
			dao.movieDelete(moviecode);
			String page = "movie_list";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
