package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();

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

		}  else if(url.contains("update.do")) { //수정버튼 페이지
			
			String sId = request.getParameter("sId");
			System.out.println("zzzz:"+sId);
			MemberDTO dto = new MemberDTO();
			dto.setUserid(sId);
			
			MemberDTO dto1 = dao.memGet(dto);
			
			//주소랑 핸드폰, 이메일 나눠서 저장. 추후 이부분은 dao로 넣을것
			String userid = dto1.getUserid();
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
			
			// 로그인 세션값과 관련된 정보수정시 세션해제
			
			session.setAttribute("sName", name); //수정 후 이름으로 세션설정
			String sName = (String)session.getAttribute("sName");
			request.setAttribute("sName", sName);
			int usergrade = dao.memberGrade(name); // 수정 후 이름에 대한 회원등급
			session.setAttribute("sGrade", usergrade);
			int sGrade = (int)session.getAttribute("sGrade");
			request.setAttribute("sGarde", sGrade);
			
			String page ="/Home";
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