package com.adv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fir.db.ConnectionProvider;


@WebServlet("/AdvLogin")
public class AdvLogin extends HttpServlet {
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update advocate set action='1' where id=?");
			ps.setString(1, id);
			ps.executeUpdate();
			response.sendRedirect("AdvocateAuth.jsp?activate");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			HttpSession session = request.getSession();
			 PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `advocate` where email='"+email+"' AND password='"+password+"'");
			 ResultSet rs = ps1.executeQuery();
			 if (rs.next()) 
			 {
				 String action = rs.getString("action");
				 
				 if(action.equals("1"))
				 {
						session.setAttribute("email", email);
						session.setAttribute("id", rs.getString("id"));
						session.setAttribute("full_name", rs.getString("full_name"));
						System.out.println("Login Done");
						response.sendRedirect("Advhome.jsp?login=done");
					 }
					 else
					 {
						response.sendRedirect("AdvLogin.jsp?inactive"); 
					 }
				 }
				 else
				 {
					 response.sendRedirect("AdvLogin.jsp");
				 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}