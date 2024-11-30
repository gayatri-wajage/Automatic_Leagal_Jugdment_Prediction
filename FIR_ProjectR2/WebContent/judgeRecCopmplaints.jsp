<%@page import="java.util.HashSet"%>
<%@page import="fir.utils.GlobalFunctions"%>
<%@page import="java.util.HashMap"%>
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
				<h1 align="center">View Recommended Cases</h1>
			</div>
		</div>
		<hr />

		<div class="row">

			<div class="col-sm-12" align="center">
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
				

				try
				{
					if(request.getParameter("id")!=null)
					{
						String id=request.getParameter("id");
						GlobalFunctions gf=new GlobalFunctions();
						HashSet<String> c_purpose_details=gf.getComplaintPurpose(id);

						System.out.println("purpose "+c_purpose_details);
					
						Connection con = ConnectionProvider.getConnection();
						PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `complaints_details` where final_status='Resolve'");
						ResultSet rs2 = ps1.executeQuery();
	//					System.out.println("Status "+ps1);
						int ii = 0;
						int total_complaints=0;
									
						HashSet<String> rsl_cid=new HashSet<String>();
						//System.out.println(" Source "+session.getAttribute("c_purpose").toString());
						
						//int count=0;
						//HashMap<String,String> rsl=new HashMap<String,String>();
						while (rs2.next()) 
						{
							System.out.println("----------------------------------------------------");
							
							//String[] c_purpose=c_purpose_details.split(",");
							
							int count=0;
							for(String c_pur:c_purpose_details)
							{
								count=count+1;
								
								String cpur=c_pur.trim();
								String db_purpose=rs2.getString("purpose").toLowerCase().trim();
								
								System.out.println("word "+c_pur+"---"+db_purpose+"======"+db_purpose.contains(cpur));
								if(db_purpose.contains(cpur))
								{
									System.out.println("Match word "+c_pur+" C- ID "+rs2.getString("id"));
									rsl_cid.add(rs2.getString("id"));
									
								}
							}
	
						}
						
						System.out.println("rsl cid "+rsl_cid);
						total_complaints=rsl_cid.size();
						
						double result_opposed_by_user=0.0;
						double result_opposed_by_Accused=0.0;
						int i=0;
						
						for(String cid: rsl_cid)
						{
				
						PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `complaints_details` where id='"+cid+"'");
						ResultSet rs1 = ps2.executeQuery();
						while(rs1.next())
						{
							System.out.println(" CID "+cid+" Result Side "+rs1.getString("result_side")+"==="+rs1.getString("result_side").equals("Accused"));
														
							if(rs1.getString("result_side").equalsIgnoreCase("Accused"))
							{
								System.out.print("Accused Side");
								result_opposed_by_Accused=result_opposed_by_Accused+1.0;
								
							}
							else
							{
								result_opposed_by_user=result_opposed_by_user+1.0;
							}
								
							++i;
							%>

					<tr class="techSpecRow">
						<td class="techSpecTD1"><%=i%></td>
						<td class="techSpecTD2">Petition_<%=cid%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_complainant")%></td>
						<td class="techSpecTD2"><%=rs1.getString("name_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("rel_accused")%></td>
						<td class="techSpecTD2"><%=rs1.getString("purpose")%></td>
						<td class="techSpecTD2"><%=rs1.getString("reg_date_time")%></td>
						<td class="techSpecTD2"><%=rs1.getString("final_status")%></td>
						<td class="techSpecTD2"><a href="judgeViewCopmplaintsInDetails.jsp?id=<%=cid%>">View Details</a></td>
					</tr>
			<%
						}
												
						}
						
						System.out.println("Total Cases "+total_complaints);
						System.out.println("result_opposed_by_user(AccusedSide) "+result_opposed_by_user);
						System.out.println("result_opposed_by_Accused(UserSide) "+result_opposed_by_Accused);
						
						System.out.println("-----------------------------");
						double u_rsl= (double)((result_opposed_by_user/total_complaints)*100);
						double a_rsl= (double)((result_opposed_by_Accused/total_complaints)*100);
						/* 
						int num1=10;
						int num2=4;
						double result = (double) (num2 / num1 );
						System.out.println("Result "+result+" "+String.format("%.3f", result));
 */
						
					//	System.out.printf("%.2f", u_rsl);
						System.out.println(u_rsl +" User Side ");
						System.out.println(a_rsl+" Accused Side ");
						
						
						
				}
	
				}catch(Exception e)
				{
					System.out.println("Ex "+e);
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
