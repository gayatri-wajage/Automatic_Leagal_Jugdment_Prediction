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
			<div class="col-sm-12">
				<h1 align="center"><%=request.getParameter("user") %> Login</h1>
			</div>
			<!-- <div class="col-sm-8"></div> -->
		</div>
		<hr />
		<div class="row">
			<div class="col-sm-6">
				
			<%
				String filename="headOffice.jpg";
				if(request.getParameter("user").equals("Police"))
				{
					filename="police.jpg";
				}
				else if(request.getParameter("user").equals("User"))
				{
					filename="fir.png";
				}
				else if(request.getParameter("user").equals("Admin"))
				{
					filename="admin.jpg";
				}
				else if(request.getParameter("user").equals("Judge"))
				{
					filename="Judge.jpg";
				}
				else if(request.getParameter("user").equals("Advocate"))
				{
					filename="Advocate.jpg";
				}
			%>
			
				<img alt="Login Image" src="images/<%=filename%>" style="width: 100%;height: 100%;">
			</div>
			<div class="col-sm-6">

				<form action="ForgetPassword" method="POST">
					<div class="mb-3 mt-3">
						<label for="email" class="form-label">Email-Id:</label> <input
							type="text" class="form-control" id="email"
							placeholder="Enter Username" name="email" required>
							<input type="hidden" name="user" value="<%=request.getParameter("user")%>">
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">Old Password:</label> <input
							type="password" class="form-control" id="password" required
							placeholder="Enter Old password" name="password">
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">New Password:</label> <input
							type="password" class="form-control" id="password" required
							placeholder="Enter New password" name="npassword">
					</div>
					<button type="submit" class="btn btn-primary">Update</button>
				</form><br>
			</div>
			<!-- <div class="col-sm-8"></div> -->
		</div>

	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
