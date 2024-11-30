package fir.headoffice;

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
import javax.servlet.http.HttpSession;

import fir.db.ConnectionProvider;

/**
 * Servlet implementation class AddPoliceAccount
 */
@WebServlet("/AddPoliceAccount")
public class AddPoliceAccount extends HttpServlet {
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
	
		String police_name= request.getParameter("police_name");
		String gender= request.getParameter("gender");
		String valid_id= request.getParameter("valid_id");
		String email= request.getParameter("email");
		String mobile= request.getParameter("mobile");
		String password= request.getParameter("password");
		
		String reg_date=LocalDate.now().toString();
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		HttpSession session=request.getSession();
		String id = session.getAttribute("id").toString();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select * from police where email='"+email+"'");
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				//Area alreay Exist
				response.sendRedirect("addHeadOffice.jsp?area=exist");
			}
			else
			{
				
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `police`(`head_office_id`,`police_name`,`police_mobile`,`police_gender`,`valid_id`,`email`,`password`) VALUES ('"+id+"','"+police_name+"','"+mobile+"','"+gender+"','"+valid_id+"','"+email+"','"+password+"')");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Registration Done");
					response.sendRedirect("addPolice.jsp?reg=done");
	
				}
				else 
				{
					System.out.println("Registration fail");
					response.sendRedirect("addPolice.jsp?failreg=done");
				}
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}