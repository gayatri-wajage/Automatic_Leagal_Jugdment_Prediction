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
				<h1 align="center">Search Complaints By Petition ID</h1>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-sm-12" align="center">
				<form action="judgeSearchCopmplaints.jsp" method="post">
					<table style="width: 50%;" align="center">
						<tr>
							<td><input type="text" placeholder="Enter Only Petition Number" class="form-control" name="fir_no" required></td>
							<td><button type="submit" class="btn btn-success">Search</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	<br/>
		
		<div class="row">
			<div class="col-sm-12" align="center">
	<%
		if(request.getParameter("fir_no")!=null)
		{
		
				String fir_no=request.getParameter("fir_no");
		%>
	
				<table class="table table-striped" style="width: 80%">
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
							<th class="techSpecTD2">Operation</th>

						</tr>
					</tbody>
					<%
					String sts=request.getParameter("sts");
					String email=session.getAttribute("email").toString();
					
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `complaints_details` where id='"+fir_no+"'");
					ResultSet rs1 = ps1.executeQuery();
					System.out.print("Status "+ps1);
					int i = 0;

					while (rs1.next()) 
					{
						i = i + 1;
						String id = rs1.getString("id");
											%>
					<tr class="techSpecRow">
						<td class="techSpecTD1"><%=i%></td>
						<td class="techSpecTD2">Petition_<%=id%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_complainant")%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("rel_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("purpose")%></td>
						<td class="techSpecTD2"><%=rs1.getString("reg_date_time")%></td>
						<td class="techSpecTD2"><%=rs1.getString("final_status")%></td>
						<td class="techSpecTD2"><a
							href="judgeViewCopmplaintsInDetails.jsp?id=<%=id%>">View
								Details</a></td>
					</tr>
					<%
							}
									%>
				</table>
<%} %>
			</div>
		</div>
	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
