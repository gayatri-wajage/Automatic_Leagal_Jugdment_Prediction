package com.adv;

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

@WebServlet("/AdvForgotPass")
public class AdvForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdvForgotPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		try {
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("Update `advocate` set password='" + password + "' where email='"+ email + "'");
			ps.executeUpdate();
			System.out.println("Password Updated Sussesfully"+ps);
			response.sendRedirect("index.jsp?update");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
