package fir.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		
		String user_type= request.getParameter("user");
		
		HttpSession session = request.getSession();
		
		System.out.println("email"+email);
		System.out.println("Password "+password);
		System.out.println("User Type "+user_type);
		
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `"+user_type+"` where email='"+ email+ "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("email", email);
				session.setAttribute("user_type", user_type);
				
				System.out.println("Login Done "+user_type);
				response.sendRedirect("home.jsp?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("login.jsp?fail=login&user="+user_type);
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}

}
