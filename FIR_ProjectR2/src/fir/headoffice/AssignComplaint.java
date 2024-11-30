package fir.headoffice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fir.db.ConnectionProvider;

/**
 * Servlet implementation class AssignComplaint
 */
@WebServlet("/AssignComplaint")
public class AssignComplaint extends HttpServlet {
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
	
		String complaint_type= request.getParameter("complaint_type");
		String id= request.getParameter("id");
		String police_email= request.getParameter("police_email");
		
		String status= "Assign";
		LocalDateTime assign_dt=LocalDateTime.now();
				
		
		try 
		{		
				PreparedStatement ps1 = con.prepareStatement("UPDATE `complaints_details` SET `complaint_type`='"+complaint_type+"',`assign_to`='"+police_email+"',`status`='"+status+"',`assign_date_time`='"+assign_dt+"',`final_status`='In-Progress' WHERE id='"+id+"'");
				System.out.println("ps1  "+ps1);
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Registration Done");
					response.sendRedirect("officerViewCopmplaints.jsp?assign=done");
	
				}
				else 
				{
					System.out.println("Registration fail");
					response.sendRedirect("officerViewCopmplaints.jsp?failassign=done");
				}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}