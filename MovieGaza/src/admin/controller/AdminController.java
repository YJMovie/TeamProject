package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
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
		} else if(url.contains("update")) { //수정버튼 페이지
			MemberDAO dao1 = new MemberDAO();
			String userid = request.getParameter("userid");
			System.out.println("zzzz:"+userid);
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			
			MemberDTO dto1 = dao1.memGet(dto);
			
			//주소랑 핸드폰, 이메일 나눠서 저장. 추후 이부분은 dao로 넣을것
			userid = dto1.getUserid();
			String name = dto1.getName();
			String gender = dto1.getGender();
			String address = dto1.getAddress();
			String[] array1 = new String[4];
			array1 = address.split(" ");
			String sample4_postcode = array1[0];
			String sample4_roadAddress = array1[1];
			String sample4_jibunAddress = array1[2];
			String sample4_detailAddress = array1[3];
			System.out.println(sample4_detailAddress);
			String phone = dto1.getPhone();
			String[] array2 = new String [3];
			array2 = phone.split("-");
			String phone1 = array2[0];
			String phone2 = array2[1];
			String phone3 = array2[2];
			String email = dto1.getEmail();
			String[] array3 = new String[2];
			array3 = email.split("@");
			String email1 = array3[0];
			String eamil2 = array3[1];
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", userid);
			map.put("name", name);
			map.put("gender", gender);
			map.put("sample4_postcode", sample4_postcode);
			map.put("sample4_roadAddress", sample4_roadAddress);
			map.put("sample4_jibunAddress", sample4_jibunAddress);
			map.put("sample4_detailAddress", sample4_detailAddress);
			map.put("phone1", phone1);
			map.put("phone2", phone2);
			map.put("phone3", phone3);
			map.put("email1", email1);
			map.put("eamil2", eamil2);
			
			request.setAttribute("dto1", map);
			
			String page = "/admin/memUpdate.jsp";
			System.out.println("뷰 고");
			RequestDispatcher rd =request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if(url.contains("memUpdate")) {
			MemberDAO dao1 = new MemberDAO();
			String userid = request.getParameter("userid");
			String userpwd = request.getParameter("userpwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String sample4_postcode = request.getParameter("sample4_postcode");
			String sample4_roadAddress = request.getParameter("sample4_roadAddress");
			String sample4_jibunAddress = request.getParameter("sample4_jibunAddress");
			String sample4_detailAddress = request.getParameter("sample4_detailAddress");
			String address = sample4_postcode + " " + sample4_roadAddress + " " + sample4_jibunAddress + " " 
			+ sample4_detailAddress;
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1+"-"+phone2+"-"+phone3;
			String email = request.getParameter("email1")+"@"+
			request.getParameter("email2");
			int usergrade = Integer.parseInt(request.getParameter("usergrade"));
			
			MemberDTO dto = new MemberDTO();
			
			System.out.println("ok..."+userid);
			
			dto.setUserid(userid);
			dto.setUserpwd(userpwd);
			dto.setName(name);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setPhone(phone);
			dto.setEmail(email);
			dto.setUsergrade(usergrade);
			System.out.println(dto.toString());
			dao1.admin_memUpdate(dto);
			
			System.out.println("ok..."+userid);
			
//			// 로그인 세션값과 관련된 정보수정시 세션해제
//			
//			session.setAttribute("sName", name); //수정 후 이름으로 세션설정
//			String sName = (String)session.getAttribute("sName");
//			request.setAttribute("sName", sName);
//			int usergrade = dao1.memberGrade(name); // 수정 후 이름에 대한 회원등급
//			session.setAttribute("sGrade", usergrade);
//			int sGrade = (int)session.getAttribute("sGrade");
//			request.setAttribute("sGarde", sGrade);
			
			String page ="/Admin/main";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if (url.contains("movie_delete")) {
			String moviecode = request.getParameter("moviecode");
			dao.movieDelete(moviecode);
			String page = "movie_list";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if(url.contains("member_delete")) {
			String userid = request.getParameter("userid");
			MemberDAO dao1 = new MemberDAO();
			dao1.memDelete(userid);
			System.out.println("memDelete.do");
			
			String page = request.getContextPath()+"/Admin/member_list";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
