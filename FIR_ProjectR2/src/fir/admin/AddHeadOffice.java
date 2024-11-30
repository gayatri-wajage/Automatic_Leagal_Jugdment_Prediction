package fir.admin;

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
 * Servlet implementation class AddHeadOffice
 */
@WebServlet("/AddHeadOffice")
public class AddHeadOffice extends HttpServlet {
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
	
		String office_name= request.getParameter("office_name");
		String area_name= request.getParameter("area_name");
		String officer_name= request.getParameter("officer_name");
		String mobile= request.getParameter("mobile");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String address= request.getParameter("address");
		
		String reg_date=LocalDate.now().toString();
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select * from headoffice where office_area='"+area_name+"'");
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				//Area alreay Exist
				response.sendRedirect("addHeadOffice.jsp?area=exist");
			}
			else
			{
				
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `headoffice`(`office_name`, `email`, `password`, `officer_name`, `officer_mobile`, `office_area`, `office_address`) VALUES ('"+office_name+"','"+email+"','"+password+"','"+officer_name+"','"+mobile+"','"+area_name+"','"+address+"')");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Registration Done");
					response.sendRedirect("addHeadOffice.jsp?reg=done");
	
				}
				else 
				{
					System.out.println("Registration fail");
					response.sendRedirect("addHeadOffice.jsp?failreg=done");
				}
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}