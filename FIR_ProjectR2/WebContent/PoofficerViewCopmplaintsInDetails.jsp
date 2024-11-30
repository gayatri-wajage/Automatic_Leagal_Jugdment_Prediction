<%@page import="java.util.Map"%>
<%@page import="fir.utils.GlobalFunctions"%>
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
				<h4 align="center">View Register Petition In-Details</h4>
			</div>
		</div>
		<hr />
		<div class="row">

			<%
				String c_id = session.getAttribute("id").toString();
				String id = request.getParameter("id");

				Connection con = ConnectionProvider.getConnection();
				PreparedStatement ps1 = con
						.prepareStatement("SELECT * FROM `complaints_details` where id='"
								+ id + "' ORDER BY id DESC");
				ResultSet rs1 = ps1.executeQuery();
				int i = 0;

				if (rs1.next()) {
					i = i + 1;
					//			String id = rs1.getString("id");
			%>
			<div class="col-sm-6" align="center">
				<table class="table table-striped" style="width: 80%">
					<tbody>
						<tr class="techSpecRow">
							<th class="techSpecTD1">Petition-ID</th>
							<td class="techSpecTD2">Petition_<%=id%></td>
						</tr>
						<tr>

							<th class="techSpecTD2">Name Complainant</th>
							<td class="techSpecTD2"><%=rs1.getString("name_complainant")%></td>
						</tr>
						<tr>

							<th class="techSpecTD2">Name Accused</th>
							<td class="techSpecTD2"><%=rs1.getString("name_accused")%></td>
						</tr>
						<tr>

							<th class="techSpecTD2">Rel Accused</th>
							<td class="techSpecTD2"><%=rs1.getString("rel_accused")%></td>
						</tr>
						<tr>

							<th class="techSpecTD2">Purpose</th>
							<td class="techSpecTD2"><%=rs1.getString("purpose")%></td>
						</tr>
						<tr>

							<th class="techSpecTD2">Petition Date</th>
							<td class="techSpecTD2"><%=rs1.getString("reg_date_time")%></td>
						</tr>
					</tbody>

					<%
						}
					%>
				</table>
			</div>
			<div class="col-sm-6" align="center">
				<form action="AssignComplaint" method="POST">
					<table class="table table-striped" style="width: 80%">
					
					<%
			GlobalFunctions gf=new GlobalFunctions();
			
			String sts=gf.getCurrentStatus(id);
						if(sts.equals("Waiting"))
						{
							
							%>

						<tbody>
							<tr class="techSpecRow">
								<th class="techSpecTD1">Complaint Types</th>
								<td><input type="text" placeholder="Enter Complaint Type"
									class="form-control" name="complaint_type" required> <input
									type="hidden" name="id" value="<%=id%>"></td>
							</tr>
							<tr>
								<th class="techSpecTD1">Assign To</th>
								<td class="techSpecTD2"><select class="form-control"
									name="police_email">
										<%

							
							Map<String,String> allPolice =gf.getAllPolice(session.getAttribute("id").toString());
							for (Map.Entry<String,String> police : allPolice.entrySet()) 
							{
								%>
										<option value="<%=police.getKey() %>"><%=police.getValue() %></option>
										<%
							}
							
							%>
								</select></td>
							</tr>
							<tr>
								<th class="techSpecTD1">Current Status</th>
								<td class="techSpecTD2"><%=rs1.getString("status")%></td>
							</tr>
							<tr>
								<th></th>
								<td>

									<button type="submit" class="btn btn-success">Submit</button>
								</td>
							</tr>
							<%}
						else{
						%>
						
						
						<tr class="techSpecRow">
							<th class="techSpecTD1">Complaint Types</th>
							<td><%=rs1.getString("complaint_type") %></td>
						</tr>
						<tr>
							<th class="techSpecTD1">Assign To</th>
							<td class="techSpecTD2"><%=rs1.getString("assign_to") %></td>
						</tr>
						<tr>
							<th class="techSpecTD1">Assign Status</th>
							<td class="techSpecTD2" style="color: red;"><%=rs1.getString("status")%></td>
						</tr>
						<tr>
							<th class="techSpecTD1">Final Status</th>
							<td class="techSpecTD2" style="color: red;"><%=rs1.getString("final_status")%></td>
						</tr>
						
						
<%} %>
						</tbody>

					</table>
				</form>
			</div>
		</div>
		<hr />
		<div class="row">
			<h1 align="center">View Update Related to Complaints</h1>
			<div class="col-sm-12" align="center">

				<table class="table table-striped" style="width: 80%">
					<tbody>
						<tr class="techSpecRow">
							<th class="techSpecTD2">Update DateTime</th>
							<th class="techSpecTD2">FileName</th>
							<th class="techSpecTD2">Progress</th>
							<th class="techSpecTD2">Status</th>

						</tr>

					</tbody>
					<%
												//Connection con = ConnectionProvider.getConnection();
												PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `complaint_status` where cmplnt_id='"+id+"' ORDER BY id DESC");
												ResultSet rs2 = ps2.executeQuery();
												int i2 = 0;

												while (rs2.next()) 
												{
													i2 = i2 + 1;
											%>
					<tr class="techSpecRow">
						<td class="techSpecTD2"><%=rs2.getString("update_datetime")%></td>
						<td class="techSpecTD2">
							<%if(!rs2.getString("file_name").equals("None"))
								{%> <a href="#"><%=rs2.getString("file_name")%></a>
						</td>
						<%} else{
							%>
						File Not Available
						<%
							}%>

						<td class="techSpecTD2"><%=rs2.getString("progress")%></td>

						<td class="techSpecTD2"><%=rs2.getString("status")%></td>

					</tr>
					<%
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
