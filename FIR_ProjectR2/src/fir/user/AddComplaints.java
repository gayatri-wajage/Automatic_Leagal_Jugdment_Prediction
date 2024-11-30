package fir.user;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import org.apache.commons.codec.binary.Hex;

import com.algo.HashGeneratorUtils;

import Blockchain.ChainConsensus;
import fir.db.ConnectionProvider;


@WebServlet("/AddComplaints")
public class AddComplaints extends HttpServlet {
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
	
		String office_id= request.getParameter("office_id");
		String name_complainant= request.getParameter("name_complainant");
		String name_accused= request.getParameter("name_accused");
		String rel_accused= request.getParameter("rel_accused");
		String purpose= request.getParameter("purpose");
		String category= request.getParameter("category");
		
		String reg_date=LocalDate.now().toString();
		
		try 
		{	HttpSession session=request.getSession();
			String email = session.getAttribute("email").toString();
			
			String data = office_id + name_complainant + name_accused + rel_accused + purpose + category;
			
			ChainConsensus.ProofOfWork(data);
			HashGeneratorUtils.generateSHA256(data);
			HashGeneratorUtils generatorUtils = null;
			String hash = generatorUtils.generateSHA256(data);
			//System.out.println("Data= "+data);
			String currenttime = reg_date;
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `complaints_details`(`complaint_by`,`head_off_id`,`name_complainant`,`name_accused`,`rel_accused`,`purpose`,`category`,`BlockData`) VALUES ('"+email+"','"+office_id+"','"+name_complainant+"','"+name_accused+"','"+rel_accused+"','"+purpose+"','"+category+"','"+hash+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("FIR Registration Done");
				response.sendRedirect("newComplaints.jsp?firreg=done");

			}
			else 
			{
				System.out.println("Registration fail");
				response.sendRedirect("newComplaints.jsp?failfir=reg");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}