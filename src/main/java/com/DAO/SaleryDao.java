package com.DAO;

import java.sql.Connection;
import java.sql.Statement;

import com.connection.DBConnect;

public class SaleryDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public SaleryDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static boolean addAdmin(int employeeId, String bonus) {
		
		boolean isSuccess = false;
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO salery VALUES (0, '"+bonus+"', "+employeeId+")";
			
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
	
	public static boolean updateBonus(int saleryId, String bonus) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE salery SET bonus_amount='"+bonus+"' WHERE salery_id = '"+saleryId+"'";
			
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


