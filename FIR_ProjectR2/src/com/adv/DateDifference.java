package com.adv;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDifference {
	
	public static long getDateDifference(String lsdate) 
	{
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date dateobj = new Date();
		String c_date = df.format(dateobj);
		System.out.println(c_date);
		
		System.out.println("ls date "+lsdate);
		long diff=0;
		long diffDays=0;
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");

		Date d1 = null;
		Date d2 = null;

		try {
			d1 = format.parse(c_date);
			d2 = format.parse(lsdate.replace("-", "/"));

			//in milliseconds
			diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			 diffDays = diff / (24 * 60 * 60 * 1000);

			System.out.print(diffDays + " days, ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return diffDays;
	}

	
	public long getCDateDifference(String stdate,String lsdate) 
	{
		
		System.out.println("st date "+stdate);
		System.out.println("ls date "+lsdate);
		long diff=0;
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

		Date d1 = null;
		Date d2 = null;

		try {
			d1 = format.parse(stdate);
			d2 = format.parse(lsdate);

			//in milliseconds
			diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			System.out.print(diffDays + " days, ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return diff;
	}

	
	
	public static void main(String[] args) throws ParseException {

		DateDifference ds=new DateDifference();
		long diff=ds.getDateDifference( "2017-12-16");
	}

}