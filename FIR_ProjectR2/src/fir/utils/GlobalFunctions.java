package fir.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import fir.db.ConnectionProvider;

public class GlobalFunctions {

	static Connection con=ConnectionProvider.getConnection();
	
	public Map<String,String> getAllPoliceHeadOffice()
	{
		Map<String,String> allHeadOffice=new HashMap<>();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `headoffice`");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				allHeadOffice.put(rs.getString("id"),rs.getString("office_name")+" "+rs.getString("office_area") );
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return allHeadOffice;
	}
	
	public Map<String,String> getAllPolice(String head_off_id)
	{
		Map<String,String> allpolice=new HashMap<>();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `police` where head_office_id='"+head_off_id+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				allpolice.put(rs.getString("email"),rs.getString("police_name"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return allpolice;
	}

	public String getCurrentStatus(String id)
	{
		String result="";
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `complaints_details` where id='"+id+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("status");
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return result;
	}
	
	
		
	public HashSet<String> getComplaintPurpose(String id)
	{
		String rr="";
		HashSet<String> rrr=new HashSet<String>();
		String result="";
		try 
		{
			List<String> stopWords = Arrays.asList("in","is", "a", "with", "to", "be","and","or","about"); // custom list of stop words
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `complaints_details` where id='"+id+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("purpose").trim();
				String[] rsl=result.split(" ");
				for(String w:rsl)
				{
					if(stopWords.contains(w))
					{
						result=result.replace(w, "-");
					}
				}
			}
			
			String[] fr=result.split(" ");
			
			for(String w:fr)
			{
				w=w.trim();
				rr=rr+","+w;
				rrr.add(w);
			}
			
			System.out.println("After remove st-----"+rr);
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return rrr;
	}
	
	
	
	public String checkCaseWorkingStatus(String id)
	{
		String result="NoWork";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `complaint_status` where cmplnt_id='"+id+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("update_datetime");
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return result;
	}
	
	//D:
	

	public List<String> getComplaintTyps()
	{
		List<String> complaint_types=new ArrayList();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `complaints_types`");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				complaint_types.add(rs.getString("complaint_type"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return complaint_types;
	}

	
	
	public String getPoliceName(String id)
	{
		String police_name="";
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `police` where id='"+id+"'" );
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				police_name=rs.getString("police_name");
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return police_name;
	}

	
}
