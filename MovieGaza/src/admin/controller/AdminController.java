package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import movie.dao.MovieDAO;
import movie.dto.MovieDTO;


@WebServlet("/Admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
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
			double score = Double.parseDouble(multi.getParameter("score"));
			Date open = Date.valueOf(multi.getParameter("open"));
			System.out.println(open);
			String lines = multi.getParameter("lines");
			System.out.println(moviecode);
			
			
			dto.setMoviecode(moviecode);
			dto.setTitle(title);
			dto.setPostfname(postfname);
			dto.setScore(score);
			dto.setOpen(open);
			dto.setLines(lines);
			
			dao.movieInsert(dto);
			System.out.println("movieInsert 완료");
			
			String page = "/admin/main.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
