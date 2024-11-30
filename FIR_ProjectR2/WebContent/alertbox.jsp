<%

if(request.getParameter("logout")!=null)
{
	out.print("<script>alert('Logout Successfully..!')</script>");
}
if(request.getParameter("assign")!=null)
{
	out.print("<script>alert('Complaint Assign Successfully..!')</script>");
}

if(request.getParameter("update")!=null)
{
	out.print("<script>alert('Password Update Successfully..!')</script>");
}
if(request.getParameter("fail")!=null)
{
	out.print("<script>alert('Incorrect Current Password..!')</script>");
}

if(request.getParameter("login")!=null)
{
	out.print("<script>alert('Login Successfully..!')</script>");
}

if(request.getParameter("fail")!=null)
{
	out.print("<script>alert('Incorrect Login Credentials..!')</script>");
}

if(request.getParameter("email")!=null)
{
	out.print("<script>alert('Email ID Already Exist Please try again..!')</script>");
}
if(request.getParameter("reg")!=null)
{
	out.print("<script>alert('Registration Successfully..!')</script>");
}
if(request.getParameter("firreg")!=null)
{
	out.print("<script>alert('Petition Registration Successfully..!')</script>");
}

if(request.getParameter("failreg")!=null)
{
	out.print("<script>alert('Registration Fails..!,  Please try again..!')</script>");
}

if(request.getParameter("delete")!=null)
{
	out.print("<script>alert('Deleted Successfully..!')</script>");
}
if(request.getParameter("faildelete")!=null)
{
	out.print("<script>alert('Deleted Fail..!')</script>");
}




%>
