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
		} else if (url.contains("addmovie")) {
			String mvcodeMax = dao.moviecodeMax();
			request.setAttribute("mvcodeMax", mvcodeMax);
			String page = "/admin/addmovie.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("insert")) {
			MovieDTO dto = new MovieDTO();
			
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
			
			////////////multi로 씁시다..////////
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
			int page_scale = 10;							
			int totPage = (int)Math.ceil(count*1.0/page_scale);	
			System.out.println("총페이지수:"+totPage);
			
			int start = (curPage-1)*page_scale+1;			
			int end = start+page_scale-1;					
			System.out.println("현재페이지번호:"+curPage);
			System.out.println("현재페이지 시작번호:"+start);
			System.out.println("현재페이지 마지막번호:"+end);
			
			
			
			int block_scale = 10;									
			int tot_block = (int)Math.ceil(totPage*1.0/block_scale);			
			
			int cur_block = (int)Math.ceil(curPage-1)/block_scale+1;	
			int block_start = (cur_block-1)*block_scale+1;			
			int block_end = block_start+block_scale-1;				
			
			if (block_end>totPage) block_end=totPage;
			int prev_page = 
					cur_block == 1 ? 1 : (cur_block-1)*block_scale;	// 이전 페이지(블록)
			int next_page = 
					cur_block > tot_block ? (cur_block*block_scale) : cur_block*block_scale+1;	// 다음 페이지(블록)
			
			if (next_page>=totPage) next_page = totPage;
			
			System.out.println("cur_block:"+cur_block);
			System.out.println("block_start:"+block_start);
			System.out.println("block_end:"+block_end);
			System.out.println("prev_page:"+prev_page);
			System.out.println("next_page:"+next_page);
			
			// list view페이지에 블럭의 시작번호,마지막번호 값을 전달하기 위해 저장(보관)
			request.setAttribute("cur_block", cur_block);
			request.setAttribute("totBlock", tot_block);
			request.setAttribute("blockStart", block_start);
			request.setAttribute("blockEnd", block_end);
			request.setAttribute("prev_page", prev_page);
			request.setAttribute("next_page", next_page);
			
			List<MemberDTO> list = dao.list(start,end);  //이부분이 문제인듯
			System.out.println("jmember.do Ok");
			request.setAttribute("list", list);
			System.out.println("jmember.do Ok");
			
			request.setAttribute("totPage", totPage);
			
			String page = "/admin/memlist.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
