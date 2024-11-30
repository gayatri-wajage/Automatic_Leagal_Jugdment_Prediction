<%@page import="java.util.Map"%>
<%@page import="fir.utils.GlobalFunctions"%>
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
<script>
	function AllowAlphabet() {
		if (!ureg.name.value.match(/^[a-zA-Z]+([ a-zA-Z])*$/) && ureg.name.value != "") {
			ureg.name.value = "";
			ureg.name.focus();
			alert("Please Enter only alphabet in First Name");
		}

	}
	function validEmail() {
		var mail = document.ureg.email.value;
		if (mail == "") {
			ureg.email.value = "";
			alert("Please insert Email Address");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else {
			ureg.email.value = "";
			alert("Email Address is Not Valid");

			return false;
		}
	}
	function Validate() {
		var y = document.ureg.mobile.value;

		if (y.charAt(0) != "7" && y.charAt(0) != "8" && y.charAt(0) != "9") {
			ureg.mobile.value = "";
			alert("Invalid Start Digit");
			return false;
		}

		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.mobile.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) {
			ureg.mobile.value = "";
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";

			ureg.mobile.value = "";
			ureg.mobile.focus();
			alert("Enter only Digits");
		}

	}
	function validuaernameandpass() {
		var pass = document.ureg.password.value;
		if (pass != "") {
			if (pass.length < 6) {
				ureg.password.value = "";
				alert("Password must contain at least 6 characters!");
				return false;
			}
		} else 
		{
			ureg.password.value = "";
			alert("Please Insert password");
			return false;

		}
	}
</script>



</head>
<body>

	<div align="center">
		<h1><jsp:include page="projectTitle.jsp" /></h1>
	</div>
	<jsp:include page="menu.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12">
				<!-- 	<img alt="Student Login Image" src="images/studentLogin.jpeg" style="width: 100%;height: 100%;"> -->

				<h1 align="center">New Complaint / Petition Registration</h1>
			</div>
			<!-- <div class="col-sm-8"></div> -->
		</div>
		<hr />
		<div class="row">
			<div class="col-sm-8">
				<form action="AddComplaints" method="post" name="ureg">
					<table style="width: 70%;" align="center">

						<tr>
							<th>Police Station Name</th>
							<td><select class="form-control" name="office_id">
						<%
						GlobalFunctions gf=new GlobalFunctions();
						Map<String,String> allHeadOffice=gf.getAllPoliceHeadOffice();
						for (Map.Entry<String,String> office : allHeadOffice.entrySet()) 
						{
							%>
								<option value="<%=office.getKey() %>"><%=office.getValue() %></option>
							<%
						}
						
						%>
							</select></td>
						</tr>
						
						<tr>
							<th>Name of Complaint</th>
							<td><input type="text" placeholder="Name of Complainant"
								class="form-control" name="name_complainant"  required></td>
						</tr>
						<tr>
							<th>Name of Accused</th>
							<td><textarea rows="2" cols="30" name="name_accused"
									class="form-control" required></textarea></td>
						</tr>
						<tr>
							<th>Relation with Accused</th>
							<td><input type="text" placeholder="Relation with Accused"
								class="form-control" name="rel_accused"  required></td>
						</tr>
						<tr>
							<th>Purpose of Petition</th>
							<td><textarea rows="2" cols="30" name="purpose"
									class="form-control" required></textarea></td>
						</tr>
						<tr>
							<th>Type of Complaint</th>
							<td><select name="category">
									<option value="">----- Select Category -----</option>
									<option value="Murder">Murder</option>
									<option value="Half Murder">Half Murder</option>
									<option value="Robbery">Robbery</option>
									<option value="Ragging">Ragging</option>
								</select></td>
						</tr>
						<tr>
							<th></th>
							<td><button type="submit" class="btn btn-success">Submit Complaints</button></td>
						</tr>

					</table>
				</form>

			</div>
			<div class="col-sm-4">
			
			<img alt="Login Image" src="images/complaint.jpg" style="width: 100%;height: 100%;">
			</div>
		</div>
		<!-- <div class="col-sm-8"></div> -->

	</div>

	<div class="mt-5 p-4 bg-dark text-white text-center">
		<p><jsp:include page="projectTitle.jsp" /></p>
	</div>

</body>
</html>
