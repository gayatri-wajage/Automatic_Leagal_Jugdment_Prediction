package fir.user;

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

import fir.db.ConnectionProvider;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
    
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String email= request.getParameter("email");
		String user_type= request.getParameter("user");
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		
		try {
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `"+user_type+"` where email='"+ email+ "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
		if(rs.next()){
		
			PreparedStatement ps = con.prepareStatement("Update `"+user_type+"` set password='" + npassword + "' where email='"+ email + "'");
			ps.executeUpdate();
			System.out.println("Password Updated Sussesfully"+ps);
			response.sendRedirect("login.jsp?update=pwd&user="+user_type);
		}
		else{
			System.out.println("Incorrect Password");
			response.sendRedirect("login.jsp?fail=pwd&user="+user_type);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
