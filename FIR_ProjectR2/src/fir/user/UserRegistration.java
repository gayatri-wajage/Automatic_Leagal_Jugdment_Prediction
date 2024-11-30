package fir.user;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fir.db.ConnectionProvider;


/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String name= request.getParameter("name");
		String gender= request.getParameter("gender");
		String mobile= request.getParameter("mobile");
		String address= request.getParameter("address");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String reg_date=LocalDate.now().toString();
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select * from user where email='"+email+"'");
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				//Email ID alreay Exist
				response.sendRedirect("userRegistration.jsp?email=exist");
			}
			else
			{
				
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user`(`full_name`, `gender`, `address`, `mobile`, `email`,`password`) VALUES ('"+name+"','"+gender+"','"+address+"','"+mobile+"','"+email+"','"+password+"')");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Registration Done");
					response.sendRedirect("login.jsp?user=User&reg=done");
	
				}
				else 
				{
					System.out.println("Login fail");
					response.sendRedirect("userRegistration.jsp?failreg=done");
				}
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}