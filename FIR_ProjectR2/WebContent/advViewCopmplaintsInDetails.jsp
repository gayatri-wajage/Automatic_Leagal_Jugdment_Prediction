<%@page import="java.util.ArrayList"%>
<%@page import="fir.utils.PredictResult"%>
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
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link active" href="advSearchCopmplaints.jsp">Search Petition</a></li>
			<li class="nav-item"><a class="nav-link" href="notification.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>

		</ul>
	</div>
</nav>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12" align="right">
				<h1 align="center">View Assign Petition In-Details</h1>
			</div>
		</div>
		<hr />
		<div class="row">

			<%
				String c_id = session.getAttribute("id").toString();
						String id = request.getParameter("id");
						PredictResult pr=new PredictResult();
						
						int h_count=Integer.parseInt(pr.getHearingCount(id))+1;
						
						String complaint_by="";
						Connection con = ConnectionProvider.getConnection();
						PreparedStatement ps1 = con
								.prepareStatement("SELECT * FROM `complaints_details` where id='"
										+ id + "' ORDER BY id DESC");
						ResultSet rs1 = ps1.executeQuery();
						int i = 0;

						if (rs1.next()) 
						{
							i = i + 1;
							complaint_by = rs1.getString("complaint_by");
							
							String c_purpose=rs1.getString("purpose");
							session.setAttribute("c_purpose", c_purpose);
							
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
					<%-- 	<tr>

							<th class="techSpecTD2">Status</th>
							<td class="techSpecTD2"><%=rs1.getString("status")%></td>
						</tr>
 --%>						<tr class="techSpecRow">
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

					</tbody>

					<%
						}
					%>
				</table>
			</div>

			<div class="col-sm-6" align="center">
				<h1 style="color: blue;">Update Current Complaints</h1>

				<form action="UploadAttachments" method="post" name="ureg" enctype="multipart/form-data">
					<%-- <table style="width: 100%;" align="center">
						<tr>
							<th>HearingCount</th>
							<td><u>Number of Hearing <%=h_count %></u></td>
						</tr>
						<tr>
							<th>Status</th>
							<td><select class="form-control" name="status">
									<option value="In-Progress">In-Progress</option>
									<option value="Resolve">Resolve</option> 
							</select>
							<input type="hidden" name="cmpt_id" value="<%=id %>">
							<input type="hidden" name="user_id" value="<%=complaint_by %>">
							</td>
						</tr>
						<tr>
							<th>Result Side</th>
							<td><select class="form-control" name="result_side">
									<option value="Accused">User Opposed</option>
									<option value="User">Accused Opposed</option> 
							</select>
							<input type="hidden" name="cmpt_id" value="<%=id %>">
							<input type="hidden" name="user_id" value="<%=complaint_by %>">
							</td>
						</tr>

						<tr>
							<th>Complaints Update </th>
							<td><textarea rows="5" cols="30" name="descriptions"
									class="form-control" required></textarea></td>
						</tr>

						<tr>
							<th>UploadFile</th>
							<td><input type="file" class="form-control" name="file" ></td>
						</tr>
						<tr>
							<th></th>
							<td><button type="submit" class="btn btn-success">Update Complaints</button></td>
						</tr>
					</table>
 					<hr/>--%>
					<h3 style="color: orange;"><u>Predict Results</u></h3>
					<table style="width: 100%;" align="center">
					
					<tr>
							<th>Next HearingCount</th>
							<td><u>Number of Hearing <%=h_count %></u></td>
						</tr>
					
						<%
						ArrayList<Double> rsl=pr.getPredictResults(id);
						if(rsl.size()>0)
						{
						%>
						
						<tr>
							<td style="color: red;"><u>User Side</u></td>
							<td><%=rsl.get(0) %>&nbsp;%</td>
						</tr>
						
						<tr>
						
							<td style="color: red;"><u>Accused Side</u></td>
							<td><%=rsl.get(1) %>&nbsp;%</td>
						</tr>
						
						
						<%
						}
						%>
						<tr>
							<td></td>
							<td><a href="advRecCopmplaints.jsp?id=<%=id%>" target="_blank">Recommended Complaints List</a></td>
						</tr>

					</table>
				</form>
			</div>
			<hr />
			<div class="	row">
				<h1 align="center">View Update Related to Complaints</h1>
				<div class="col-sm-12" align="center">

					<table class="table table-striped" style="width: 80%">
						<tbody>
							<tr class="techSpecRow">
								<th class="techSpecTD2">Update By</th>
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
						GlobalFunctions gf=new GlobalFunctions();
						
	
						while (rs2.next()) 
						{
							i2 = i2 + 1;
							String pname="Judge";
							if(!(rs2.getString("poice_id").equals("Judge")))
							{
								pname=gf.getPoliceName(id);
							}
							
						%>
						<tr class="techSpecRow">
							<td class="techSpecTD2"><%=pname%></td>
							<td class="techSpecTD2"><%=rs2.getString("update_datetime")%></td>
							<td class="techSpecTD2">
							<%if(!rs2.getString("file_name").equals("None"))
								{%>
							<a href="#"><%=rs2.getString("file_name")%></a></td>
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
