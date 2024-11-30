<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
session.setAttribute("user_type", "Geust");
%>
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
if(request.getParameter("update")!=null)
{
	out.println("<script>alert('Password Updated Successful...........!')</script>");
}
%>
	<!-- <div align="center">
	 -->
	 <div align="center">	<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<jsp:include page="menu.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12">
			<h1 align="center" style="color: blue;">Welcome </h1>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-12" align="center">
			<img alt="Notice Board" src="images/rules.jpg" style="width: 100%;height: 110%;">
		</div>
	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp"/></p>
	</div>

</body>
</html>
