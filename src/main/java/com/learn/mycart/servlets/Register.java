package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			
			//Validation
			if(userName.isEmpty())
			{
				out.println("Name is blank");
			}
			
			//creating user object to store data
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx= hibernateSession.beginTransaction();
			
			int userId=(int)hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			
		HttpSession httpSession = request.getSession();
		httpSession .setAttribute("message","Registered Sucessfully!! User ID is:"+userId);
		response.sendRedirect("register.jsp");
		return;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
