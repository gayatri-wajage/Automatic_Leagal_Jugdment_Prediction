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
if(request.getParameter("login")!=null)
{
	out.println("<script>alert('Advocate Login Successful...........!')</script>");
}
%>
	<div align="center">
		<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="advSearchCopmplaints.jsp">Search Petition</a></li>
			<li class="nav-item"><a class="nav-link" href="notification.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>

		</ul>
	</div>
</nav>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12">
				<h1 align="center">Welcome Advocate <%=session.getAttribute("full_name").toString()%></h1>
			</div>
			<hr/>
			<div class="col-sm-12">
				
				<img alt="Login Image" src="images/adv.jpg" style="width: 100%;height: 80%;">
			</div>
			
			<!-- <div class="col-sm-8"></div> -->
		</div>
		<hr />
	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
