
<%
String user_type=session.getAttribute("user_type").toString();
if(user_type.equals("Geust"))
{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active"
				href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="login.jsp?user=Judge">Judge Login</a></li>
			<li class="nav-item"><a class="nav-link"
				href="login.jsp?user=Admin">Admin Login</a></li>
			<li class="nav-item"><a class="nav-link"
				href="login.jsp?user=HeadOffice">Head Office</a></li>
			<li class="nav-item"><a class="nav-link"
				href="login.jsp?user=Police">Police Login</a></li>
			<li class="nav-item"><a class="nav-link"
				href="login.jsp?user=User">User Login</a></li>
			<li class="nav-item"><a class="nav-link"
				href="userRegistration.jsp">User Registration</a></li>
				<li class="nav-item"><a class="nav-link"
				href="AdvLogin.jsp">Advocate Login</a></li>
			<li class="nav-item"><a class="nav-link"
				href="advRegistration.jsp">Advocate Registration</a></li>
			<!-- <li class="nav-item">
        <a class="nav-link" href="aboutUs.jsp">About Us</a>
      </li> -->
		</ul>
	</div>
</nav>
<%
}
if(user_type.equals("HeadOffice"))
{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="addPolice.jsp">Add
					Police </a></li>
			<li class="nav-item"><a class="nav-link" href="viewPolice.jsp">View
					Police</a></li>
			<li class="nav-item"><a class="nav-link"
				href="officerViewCopmplaints.jsp">New Complaints</a></li>
			<li class="nav-item"><a class="nav-link"
				href="officerViewSolveCopmplaints.jsp">Resolve Complaints</a></li>
			<li class="nav-item"><a class="nav-link" href="notification.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
		</ul>
	</div>
</nav>

<%}

if(user_type.equals("Admin"))

{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="addHeadOffice.jsp">Add HeadOffice </a></li>
			<li class="nav-item"><a class="nav-link"
				href="viewHeadOffice.jsp">View HeadOffice</a></li>
			<li class="nav-item"><a class="nav-link"
				href="AdvocateAuth.jsp">Advocate Authentication</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
		</ul>
	</div>
</nav>

<%}if(user_type.equals("User"))

{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link"
				href="newComplaints.jsp">New Complaints</a></li>
			<li class="nav-item"><a class="nav-link"
				href="viewCopmplaints.jsp">Complaints Status</a></li>
			<li class="nav-item"><a class="nav-link" href="Usernotification.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
		</ul>
	</div>
</nav>

<%}if(user_type.equals("Police"))

{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="policeViewCopmplaints.jsp?sts=In-Progress">Assign
					Complaints</a></li>
			<li class="nav-item"><a class="nav-link"
				href="policeViewCopmplaints.jsp?sts=Resolve">ResolveComplaints</a></li>
			<li class="nav-item"><a class="nav-link" href="notificationPo.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>

		</ul>
	</div>
</nav>

<%}
if(user_type.equals("Judge"))
{
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link"
				href="judgeSearchCopmplaints.jsp">Search Petition</a></li>
			<li class="nav-item"><a class="nav-link" href="notification.jsp">Notification</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>

		</ul>
	</div>
</nav>

<%}
if(user_type.equals("Advocate"))
{
%>

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

<%}




%>
<jsp:include page="alertbox.jsp" />