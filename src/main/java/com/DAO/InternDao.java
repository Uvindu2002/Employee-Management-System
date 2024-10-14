package com.DAO;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;

import com.connection.DBConnect;
import com.model.InternModel;

public class InternDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public InternDao(Connection con) {
		InternDao.con = con;
	}
	
	public InternModel login(String email, String password) {
		
		InternModel em = null;
		String sql = null;
		
		
		try {
			
			
			sql = "SELECT * FROM intern WHERE email = ? AND password = ?";
		        

			
			if (sql != null) {
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				 
				while(rs.next()) {
					em = new InternModel();
					em.setInternId(rs.getInt(1));
					em.setFirstName(rs.getString(2));
					em.setLastName(rs.getString(3));
					em.setEmail(rs.getString(4));
					
				}
			}			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return em;
		
	}
	
	public static boolean addIntern(String firstName, String lastName, String email, String mobile, int departmentId, String gender, String address) {
		
		boolean isSuccess = false;
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO intern VALUES (0,'"+firstName+"', '"+lastName+"', '"+email+"', '"+gender+"', '"+mobile+"', '"+address+"', '', "+departmentId+", 1, '')";
			
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
	
	public static boolean confirmIntern(int internId, String salery) {
		
		String password = generateUniquePassword();
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			
			stmt = con.createStatement();			
			String sql = "UPDATE intern SET password='"+password+"', status= 2, basic_salery='"+salery+"' WHERE intern_id = '"+internId+"'";			
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
	
	private static String generateUniquePassword() {
	    // Generate a random 8-digit password
	    SecureRandom secureRandom = new SecureRandom();
	    byte[] randomBytes = new byte[6];
	    secureRandom.nextBytes(randomBytes);
	    return Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes).substring(0, 8);
	}
	
	public static boolean updateAdmin(String adminID, String firstName, String lastName, String email, String mobile, String password) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE admin SET first_name='"+firstName+"', last_name='"+lastName+"',email='"+email+"' ,mobile='"+mobile+"', password='"+password+"' WHERE admin_id = '"+adminID+"'";
			
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
	
	public static boolean updateIntern(int internId, String firstName, String lastName, String email, String mobile, String address) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE intern SET first_name='"+firstName+"', last_name='"+lastName+"',email='"+email+"' ,mobile='"+mobile+"', address='"+address+"' WHERE intern_id = '"+internId+"'";
			
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
