package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.logDAO;
import member.dto.MemberDTO;


@WebServlet("/Log/*")
public class Logcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    logDAO dao = new logDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = request.getRequestURL().toString();
		System.out.println(url);
		if(url.contains("view.do")) {
			System.out.println("뷰페이지");
			
			String page = "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		if(url.contains("login.do")) {
			String userid = request.getParameter("userid");
			String userpwd = request.getParameter("userpwd");
			System.out.println("id:"+userid+",pwd:"+userpwd);
			MemberDTO dto = new MemberDTO();
	 		
			dto.setUserid(userid);
			dto.setUserpwd(userpwd);
			String result = dao.log(dto);
			
			if(result != null && result != "") {
			System.out.println("ㅇㅇ"+result);
			
			session.setAttribute("sid", userid);
			session.setAttribute("sName", result);
			String sid = (String)session.getAttribute("sid");
			String sName = (String)session.getAttribute("sName");
			request.setAttribute("sid", sid);
			request.setAttribute("sName", result);
			String page ="/Home";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			}else {
				System.out.println("비밀번호 불일치");
				int error = 1;
				request.setAttribute("error", error);
				String page = "/member/login.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
			
		} else if (url.contains("logout.do")) {
			System.out.println("logout.do Ok...");
			session.invalidate();
			String page ="/Home";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	} 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
