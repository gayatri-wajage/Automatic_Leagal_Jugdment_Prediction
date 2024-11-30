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
if(request.getParameter("inactive")!=null)
{
	out.println("<script>alert('Your Account not Activated and Verified yet by Admin')</script>");
}
if(request.getParameter("reg")!=null)
{
	out.println("<script>alert('Advocate Registration Successfull')</script>");
}
%>
	<div align="center">
		<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<jsp:include page="menu.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12">
				<h1 align="center">Advocate Login</h1>
			</div>
			<!-- <div class="col-sm-8"></div> -->
		</div>
		<hr />
		<div class="row">
			<div class="col-sm-6">
				
			
				<img alt="Login Image" src="images/Advocate.jpg" style="width: 100%;height: 100%;">
			</div>
			<div class="col-sm-6">

				<form action="AdvLogin" method="POST">
					<div class="mb-3 mt-3">
						<label for="email" class="form-label">Email-Id:</label> <input
							type="text" class="form-control" id="email"
							placeholder="Enter Username" name="email" required>
							<%-- <input type="hidden" name="user" value="<%=request.getParameter("user")%>"> --%>
							
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">Password:</label> <input
							type="password" class="form-control" id="password" required
							placeholder="Enter password" name="password">
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
				</form><br>
				<button type="submit" class="btn btn-primary"><b><a href="ForgotAdPass.jsp" style="color:white;">
				<i>Forgot Password</i></b></a></button>
			</div>
			<!-- <div class="col-sm-8"></div> -->
		</div>

	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
