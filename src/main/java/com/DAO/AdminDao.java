package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.connection.DBConnect;
import com.model.AdminModel;

public class AdminDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public AdminDao(Connection con) {
		AdminDao.con = con;
	}
	
	public AdminModel login(String email, String password) {
		
		AdminModel em = null;
		String sql = null;
		
		
		try {
			
			
			sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
		        

			
			if (sql != null) {
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				 
				while(rs.next()) {
					em = new AdminModel();
					em.setId(rs.getString(1));
					em.setFirstName(rs.getString(2));
					em.setLastName(rs.getString(3));
					em.setEmail(rs.getString(4));
					em.setPhone(rs.getString(6));;
					
				}
			}			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return em;
		
	}
	
	public static boolean addAdmin(String firstName, String lastName, String email, String mobile, String password) {
		
		boolean isSuccess = false;
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO admin VALUES (0, '"+firstName+"', '"+lastName+"', '"+email+"', '"+password+"', '"+mobile+"')";
			
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
	
	public static boolean updateAdmin(String adminID, String firstName, String lastName, String email, String mobile) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE admin SET first_name='"+firstName+"', last_name='"+lastName+"',email='"+email+"' ,mobile='"+mobile+"' WHERE admin_id = '"+adminID+"'";
			
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