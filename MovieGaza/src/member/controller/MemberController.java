package member.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.dto.MemberDTO;


@WebServlet("/Member/*")

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet 요청...");
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURL().toString();

		System.out.println(url);

		MemberDAO dao = new MemberDAO();
		
		if (url.contains("view.do")) {
			String page = "/member/welcome.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		if (url.contains("join.do")) {
			String page = "/member/JoinForm.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		if (url.contains("list.do")) {
			System.out.println("list.do 처리중");
			
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
			
			String page="/page/memview.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);

		} else if (url.contains("insert.do")) { // return 값은 true false
			System.out.println("insert.do 처리중");

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
			
		

			MemberDTO dto = new MemberDTO();

			dto.setUserid(userid);
			dto.setUserpwd(userpwd);
			dto.setName(name);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setPhone(phone);
			dto.setEmail(email);

			System.out.println(dto);
			dao.insertJoin(dto);

			
			request.setAttribute("name", name);
			 
			String page = "/member/welcome.jsp"; 
			RequestDispatcher rd = request.getRequestDispatcher(page); 
			rd.forward(request, response);

		} else if(url.contains("update.do")) { //수정버튼 페이지
			
			String name = request.getParameter("sName");
			System.out.println("zzzz:"+name);
			MemberDTO dto = new MemberDTO();
			dto.setName(name);
			
			MemberDTO dto1 = dao.memGet(dto);
			request.setAttribute("dto1", dto1);
			
			String page = "/member/memUpdate.jsp";
			System.out.println("뷰 고");
			RequestDispatcher rd =request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if(url.contains("memUpdate.do")) {
			System.out.println("memUpdate.do");
			
			String userid = request.getParameter("userid");
			String userpwd = request.getParameter("userpwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			
			MemberDTO dto = new MemberDTO();
			System.out.println(dto.toString());
			System.out.println("ok..."+userid);
			
			dto.setUserid(userid);
			dto.setUserpwd(userpwd);
			dto.setName(name);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setPhone(phone);
			dto.setEmail(email);
			
			dao.memUpdate(dto);
			System.out.println("ok..."+userid);
			
			String page ="${path}/controller/jmember.do";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if (url.contains("idCheck.do")) { // return 값은 true false

			String userid = request.getParameter("userid");
			int result = dao.confirmID(userid);

			request.setAttribute("userid", userid);
			request.setAttribute("result", result);
			System.out.println("result:" + result);

			String page = "/member/checkId.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);

		} else if(url.contains("delete.do")) {
			System.out.println("memDelete.do");
			String userid = request.getParameter("userid");
			
			dao.memDelete(userid);
			System.out.println("memDelete.do");
			
			String page = request.getContextPath()+"/controller/jmember.do";
			System.out.println("memDelete.do");
			response.sendRedirect(page);
		}
			 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}