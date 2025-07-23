package com.pack.event_managment_system;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect 
{
	private static Connection con=null;
	
	private DBConnect() {}
	
	static
	{
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection(DBInfo.dburl, DBInfo.user, DBInfo.pass);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static Connection getCon()
	{
		try {
			
			return DriverManager.getConnection(DBInfo.dburl, DBInfo.user, DBInfo.pass);
		     } catch (Exception e) {
		
		e.printStackTrace();
		         }
		return con;
	}

}
