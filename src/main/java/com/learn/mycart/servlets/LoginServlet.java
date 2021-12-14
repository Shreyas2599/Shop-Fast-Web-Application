package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		PrintWriter out=response.getWriter();
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			//validation
			
			//authenticating user
			 UserDao userDao=new UserDao(FactoryProvider.getFactory());
			 User user=userDao.getUserByEmailAndPassword(email, password);
			 //System.out.println(user);
			 
			HttpSession httpSession =request.getSession();
			 
			 if(user==null)
			 {
				
				 httpSession.setAttribute("message", "Invalid Details !! Try with another one");
				 response.sendRedirect("login.jsp");
				 ;
			 }else
			 {
				 out.println("<h1>Welcome"+user.getUserName()+"</h1>");
				 
				 //login
				 httpSession.setAttribute("current-user", user);
				 
				 if(user.getUserType().equals("admin"))
				 {
					//admin.jsp
					 response.sendRedirect("admin.jsp");
				 }
				 else if(user.getUserType().equals("normal"))
				 {
					//normal.jsp
					 response.sendRedirect("Normal.jsp");
				 }else
				 {
					 out.println("We have not identified user type....");
				 }
			 }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
