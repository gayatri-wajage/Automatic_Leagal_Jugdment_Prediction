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
<%
if(request.getParameter("activate")!=null)
{
	out.println("<script>alert('Advocate Account Verified Activated by Admin')</script>");
}
%>
	<div align="center">
		<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<jsp:include page="menu.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12" align="right">
				<h1 align="center">View Advocate Details</h1>
			</div>
		</div>
		<hr />
			<div class="row">
			<div class="col-sm-12" align="center">

				<table class="table table-striped" style="width: 80%">
					<tbody>
						<tr class="techSpecRow">
							<th class="techSpecTD1">Sr.No</th>
							<th class="techSpecTD2">Advocate Name</th>
							<th class="techSpecTD2">Gender</th>
							<th class="techSpecTD2">Address</th>
							<th class="techSpecTD2">Mobile</th>
							<th class="techSpecTD2">Valid Id Proof</th>
							<th class="techSpecTD2">EmailID</th>
							<th class="techSpecTD2">Action</th>
						</tr>
					</tbody>
					<%
												Connection con = ConnectionProvider.getConnection();
												PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `advocate` ORDER BY id DESC");
												ResultSet rs1 = ps1.executeQuery();
												int i = 0;

												while (rs1.next()) 
												{
													i = i + 1;
													String id = rs1.getString("id");
													String action = rs1.getString("action");
											%>
					<tr class="techSpecRow">
						<td class="techSpecTD1"><%=i%></td>
						<td class="techSpecTD2"><%=rs1.getString("full_name")%></td>
						<td class="techSpecTD2"><%=rs1.getString("gender")%></td>
						<td class="techSpecTD2"><%=rs1.getString("address")%></td>
						<td class="techSpecTD2"><%=rs1.getString("mobile")%></td>
						<td class="techSpecTD2"><%=rs1.getString("valid_id")%></td>
						<td class="techSpecTD2"><%=rs1.getString("email")%></td>
						
						<%if(action.equals("0")){ %>
						<td class="techSpecTD2"><a href="AdvLogin?id=<%=id%>">Activate</a></td>
						<%}else{ %>
						<td class="techSpecTD2">Verified</td>
						<%
							}
						}
						%>
					</tr>
				</table>

			</div>
		</div>
	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
