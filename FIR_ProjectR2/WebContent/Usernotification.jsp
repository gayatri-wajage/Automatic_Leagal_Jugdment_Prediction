<%@page import="fir.utils.DateTimeDifference"%>
<%@page import="fir.utils.GlobalFunctions"%>
<%@page import="java.time.LocalDateTime"%>
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
				<h1 align="center" style="color: red;">View Notifications</h1>
			</div>
		</div>
		<hr />
			<div class="row">
			<div class="col-sm-12" align="center">

				<table class="table table-striped" style="width: 80%">
					<tbody>
						<tr class="techSpecRow">
							<th class="techSpecTD1">Sr.No</th>
							<th class="techSpecTD1">Petition-ID</th>
							
							<th class="techSpecTD2">Name Complainant</th>
<!-- 							<th class="techSpecTD2">Name Accused</th>
							<th class="techSpecTD2">Rel Accused</th>
 -->							<th class="techSpecTD2">Purpose</th>
							<th class="techSpecTD2">Petition Date</th>
							<th class="techSpecTD2">Status</th>
							<th class="techSpecTD2">Operation</th>
							
						</tr>
					</tbody>
					<%
					String c_id=session.getAttribute("id").toString();
					Connection con = ConnectionProvider.getConnection();
					String user_type=session.getAttribute("user_type").toString();
					String col_name="head_off_id";
					if(user_type.equals("Police"))
					{
							col_name="assign_to";
							c_id=session.getAttribute("email").toString();
					}
					if(user_type.equals("User"))
					{
						col_name="complaint_by";
						c_id=session.getAttribute("email").toString();
					}
					
					String sql_query="SELECT * FROM `complaints_details` where "+col_name+"='"+c_id+"' ORDER BY id DESC";
					System.out.print("SQL "+sql_query);
					PreparedStatement ps1 = con.prepareStatement(sql_query);
					ResultSet rs1 = ps1.executeQuery();
					int i = 0;
					GlobalFunctions gf=new GlobalFunctions();
					DateTimeDifference df=new DateTimeDifference();
	
					while (rs1.next()) 
					{
						i = i + 1;
						String id = rs1.getString("id");
						
						String last_date=LocalDateTime.now().toString();
						String sts=rs1.getString("final_status");
						String first_date="";
						if(sts.equals("Waiting"))
						{
							first_date=rs1.getString("reg_date_time");
						}
						else if(sts.equals("In-Progress"))
						{
							
							//check working or not
							String wrk_sts=gf.checkCaseWorkingStatus(id);
							if(wrk_sts.equals("NoWork"))
							{
								first_date=rs1.getString("reg_date_time");
							}
							else
							{
								first_date=wrk_sts;
							}
						}
						else if(sts.equals("Resolve"))
						{
							first_date=gf.checkCaseWorkingStatus(id);
						}
						
						long diff_time1=df.getDateDifference(first_date,last_date);
						
						System.out.println(first_date+"--"+last_date+"==="+diff_time1);
						if(diff_time1>10)
						{
											%>
					<tr class="techSpecRow">
						<td class="techSpecTD1"><%=i%></td>
						<td class="techSpecTD2">Petition_<%=id%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_complainant")%></td>
						<%-- <td class="techSpecTD2"><%=rs1.getString("name_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("rel_accused")%></td>
						 --%><td class="techSpecTD2"><%=rs1.getString("purpose")%></td>
						<td class="techSpecTD2"><%=rs1.getString("reg_date_time")%></td>
						<td class="techSpecTD2"><%=rs1.getString("final_status")%></td>
						<td class="techSpecTD2"><a href="userViewCopmplaintsInDetails.jsp?id=<%=id%>">View Details</a></td>
					</tr>
					<%
						}
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
