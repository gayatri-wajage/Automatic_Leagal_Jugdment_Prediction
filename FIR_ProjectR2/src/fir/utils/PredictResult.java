package fir.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;

import fir.db.ConnectionProvider;


/*This class is used for predict Result from Resolve Complaints*/
public class PredictResult 
{
	static Connection con=ConnectionProvider.getConnection();
	public ArrayList<Double> getPredictResults(String id)
	{
		ArrayList<Double> rsl=new ArrayList<>();
		try
		{
			
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
				
				rsl.add(u_rsl);
				rsl.add(a_rsl);
				
				
				
		

		}catch(Exception e)
		{
			System.out.println("Ex "+e);
		}

		
		
		return rsl;
	}
	
	
	public String getHearingCount(String cid)
	{
		String count="0";
		try 
		{

			PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(id) FROM `complaint_status` where cmplnt_id='"+cid+"'");
			ResultSet rs1 = ps2.executeQuery();
			if(rs1.next())
			{
				count= rs1.getString(1);
			}
			
		} catch (Exception e) {
			System.out.println("Exc "+e);
		}
		return count;
	}
	
	public String getResolvedDate(String cid)
	{
		String rsl="Not_Resolved";
		try 
		{

			PreparedStatement ps2 = con.prepareStatement("SELECT update_datetime FROM `complaint_status` where cmplnt_id='"+cid+"' ORDER BY id DESC");
			System.out.println("B "+ps2);
			
			ResultSet rs1 = ps2.executeQuery();
			if(rs1.next())
			{
				rsl= rs1.getString(1);
			}
			
			System.out.println("RSL  "+rsl);
			
			
		} catch (Exception e) {
			System.out.println("Exc "+e);
		}
		return rsl;
	}
	
	

}


