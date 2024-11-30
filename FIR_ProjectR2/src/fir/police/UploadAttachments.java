package fir.police;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import fir.db.ConnectionProvider;

/**
 * Servlet implementation class UploadAttachments
 */
@WebServlet("/UploadAttachments")
public class UploadAttachments extends HttpServlet 
{
	static Connection con;
	final String UPLOAD_DIRECTORY = "E:/Santosh Sir/workspace/FIR_Project/WebContent/files/";
	static int i = 0;
	
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) 
		{
			try 
			{
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				System.out.println("ABCD");
				String FileName = "";
				String FileExtention = "";
				long FileSize = 0;

				for (FileItem item1 : multiparts)
				{
					if (!item1.isFormField()) 
					{

						try {
							
						System.out.println("4");
						String name = new File(item1.getName()).getName();
						item1.write(new File(UPLOAD_DIRECTORY + File.separator+name));
						FileName = item1.getName();
						FileExtention = item1.getContentType();
						FileSize = item1.getSize();

						} catch (Exception e) {
						
							System.out.println("File Now Select" );
						}
						FileName="None";
					}
					else
					{
						System.out.println("System Not Selects ");
					}
				}

				String status	="",descriptions="";
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("status"))
					{
						status = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("descriptions")) 
					{
						descriptions = (String) item.getString();
					}
				}
				
				String user_id="";
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("user_id")) 
					{
						user_id = (String) item.getString();
					}
				}
				
				
				String cmpt_id="";
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("cmpt_id")) 
					{
						cmpt_id = (String) item.getString();
					}
				}
				
				
				String result_side="";
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("result_side")) 
					{
						result_side = (String) item.getString();
					}
				}
				
				
				System.out.println("FileName " + FileName);
				System.out.println("File Extension " + FileExtention);
				System.out.println("File Size " + FileSize);

				HttpSession session=request.getSession();
				String email_id=session.getAttribute("email").toString();
				String police_id=session.getAttribute("id").toString();

				String pageName="policeViewCopmplaintsInDetails.jsp?id=";
				if(email_id.equals("judge@gmail.com"))
				{
					police_id="Judge";
					pageName="judgeViewCopmplaintsInDetails.jsp?id=";
				}
				try 
				{

					PreparedStatement ps1 = con.prepareStatement("INSERT INTO `complaint_status`(`file_name`, `progress`, `cmplnt_id`, `poice_id`, `user_id`, `status`) VALUES ('"+FileName+"','"+descriptions+"','"+cmpt_id+"','"+police_id+"','"+user_id+"','"+status+"')");
					int rs = ps1.executeUpdate();
					if (rs > 0) 
					{
						
						updateFinalStatus(cmpt_id,status,result_side);
						System.out.println("Update Add Done ");
						
						response.sendRedirect(pageName+cmpt_id);
						
					} else 
					{
						System.out.println("Not Update Something Wrong ");
						
						response.sendRedirect(pageName+cmpt_id+"&failupdate=done");
						
					}
				} 
				catch (Exception e) 
				{
					System.out.println("Exception e" +e);
				}
			}
			catch (Exception ex) {
				System.out.println("Exception e" +ex);
			}
		}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("sellerUploadProduct.jsp?fail=uplaod");
		}
	}
	
	private void updateFinalStatus(String id,String sts,String result_side)
	{
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE `complaints_details` SET final_status='"+sts+"',result_side='"+result_side+"' where id='"+id+"'");
			int rsl = ps.executeUpdate();
			if(rsl>0)
			{
				System.out.println("Final Status also update in Complaint Details table");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
