package com.DAO;

import java.sql.Connection;
import java.sql.Statement;

import com.connection.DBConnect;

public class InternLeaveDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public InternLeaveDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	public static boolean addleave(String reason, String days, int employeeId, String date) {
		
		boolean isSuccess = false;
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO internleave VALUES (0, '"+reason+"', '"+days+"', "+employeeId+", '"+date+"', 1)";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static boolean updateLeave(int leaveId, String date, String reason, String days, int employeeId) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE internleave SET requestDate='"+date+"', reason='"+reason+"', days='"+days+"' WHERE leave_id = '"+leaveId+"' && employee_id = '"+employeeId+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static boolean acceptLeave(int leaveId) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE internleave SET status= 2 WHERE leave_id = '"+leaveId+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}

}
