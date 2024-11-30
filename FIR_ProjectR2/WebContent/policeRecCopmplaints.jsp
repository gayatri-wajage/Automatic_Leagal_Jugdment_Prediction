<%@page import="java.util.HashSet"%>
<%@page import="fir.utils.GlobalFunctions"%>
<%@page import="java.util.HashMap"%>
<%@page import="fir.db.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title><jsp:include page="projectTitle.jsp" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.fakeimg {
	height: 100px;
	background: #aaa;
}
</style>
</head>
<body>

	<div align="center">
		<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<jsp:include page="menu.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12" align="right">
				<h1 align="center">View Recomndation Cases</h1>
			</div>
		</div>
		<hr />

		<div class="row">

			<div class="col-sm-12" align="center">
				<table class="table table-striped" style="width: 100%">
					<tbody>
						<tr class="techSpecRow">
							<th class="techSpecTD1">Sr.No</th>
							<th class="techSpecTD1">Petition-ID</th>

							<th class="techSpecTD2">Name Complainant</th>
							<th class="techSpecTD2">Name Accused</th>
							<th class="techSpecTD2">Rel Accused</th>
							<th class="techSpecTD2">Purpose</th>
							<th class="techSpecTD2">Petition Date</th>
							<th class="techSpecTD2">Status</th>
						<!-- 	<th class="techSpecTD2">Operation</th> -->

						</tr>
					</tbody>
					<%
				

				try
				{
					if(request.getParameter("id")!=null)
					{
						String id=request.getParameter("id");
						GlobalFunctions gf=new GlobalFunctions();
						HashSet<String> c_purpose_details=gf.getComplaintPurpose(id);

						System.out.println("purpose "+c_purpose_details);
					
						Connection con = ConnectionProvider.getConnection();
						PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `complaints_details`");
						ResultSet rs2 = ps1.executeQuery();
	//					System.out.println("Status "+ps1);
						int ii = 0;
							
						HashSet<String> rsl_cid=new HashSet<String>();
						//System.out.println(" Source "+session.getAttribute("c_purpose").toString());
						
						//int count=0;
						//HashMap<String,String> rsl=new HashMap<String,String>();
						while (rs2.next()) 
						{
							System.out.println("----------------------------------------------------");
							
							//String[] c_purpose=c_purpose_details.split(",");
							
							int count=0;
							for(String c_pur:c_purpose_details)
							{
								count=count+1;
								
								String cpur=c_pur.trim();
								String db_purpose=rs2.getString("purpose").toLowerCase().trim();
								
								System.out.println("word "+c_pur+"---"+db_purpose+"======"+db_purpose.contains(cpur));
								if(db_purpose.contains(cpur))
								{
									System.out.println("Match word "+c_pur+" C- ID "+rs2.getString("id"));
									rsl_cid.add(rs2.getString("id"));
								}
							}
	
						}
						System.out.print("rsl cid "+rsl_cid);
						for(String cid: rsl_cid)
						{
						PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `complaints_details` where id='"+cid+"'");
						ResultSet rs1 = ps2.executeQuery();
						int i=0;
						while(rs1.next())
						{
						
							++i;
							%>

					<tr class="techSpecRow">
						<td class="techSpecTD1"><%=i%></td>
						<td class="techSpecTD2">Petition_<%=rs1.getString("id")%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_complainant")%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("rel_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("purpose")%></td>
						<td class="techSpecTD2"><%=rs1.getString("reg_date_time")%></td>
						<td class="techSpecTD2"><%=rs1.getString("final_status")%></td>
						<%-- <td class="techSpecTD2"><a
							href="judgeViewCopmplaintsInDetails.jsp?id=<%=id%>">View
								Details</a></td> --%>
					</tr>
			<%
						}
						}
				}
	
				}catch(Exception e)
				{
					System.out.println("Ex "+e);
				}
					%>
				</table>

			</div>
		</div>
	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
