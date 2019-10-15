package join.Controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import join.dao.joinDAO;
import join.dto.joinDTO;

@WebServlet("/join_servlet/*")

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet 요청...");
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURL().toString();

		System.out.println(url);

		joinDAO dao = new joinDAO();
		
		if (url.contains("view.do")) {
			String page = "/member/view/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		if (url.contains("join.do")) {
			String page = "/member/view/JoinForm.jsp";
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
			
		

			joinDTO dto = new joinDTO();

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
			 
			String page = "/member/view/view.jsp"; 
			RequestDispatcher rd = request.getRequestDispatcher(page); 
			rd.forward(request, response);
			 
			/*
			 * String path=request.getContextPath()+"/member/view/view.jsp";
			 * response.sendRedirect(path);
			 */

		} else if (url.contains("idCheck.do")) { // return 값은 true false

			String userid = request.getParameter("userid");
			int result = dao.confirmID(userid);

			request.setAttribute("userid", userid);
			request.setAttribute("result", result);
			System.out.println("result:" + result);

			String page = "/member/view/checkId.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);

		}
			 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}