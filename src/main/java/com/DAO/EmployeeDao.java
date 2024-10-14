package com.DAO;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;

import com.connection.DBConnect;
import com.model.EmployeeModel;

public class EmployeeDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public EmployeeDao(Connection con) {
		EmployeeDao.con = con;
	}
	

	public EmployeeModel login(String email, String password) {
		
		EmployeeModel em = null;
		String sql = null;
		
		
		try {
			
			
			sql = "SELECT * FROM employee WHERE email = ? AND password = ?";
		        

			
			if (sql != null) {
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				 
				while(rs.next()) {
					em = new EmployeeModel();
					em.setEmployeeId(rs.getInt(1));
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
	
	public static boolean addEmployee(String firstName, String lastName, String email, String mobile, int departmentId, String gender, String address) {
		
		boolean isSuccess = false;
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO employee VALUES (0,'"+firstName+"', '"+lastName+"', '"+email+"', '"+gender+"', '"+mobile+"', '"+address+"', '', "+departmentId+", 1, '')";
			
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
	
	public static boolean confirmEmployee(int employeeId, String salery) {
		
		String password = generateUniquePassword();
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			
			stmt = con.createStatement();			
			String sql = "UPDATE employee SET password='"+password+"', status= 2, basic_salery='"+salery+"' WHERE employee_id = '"+employeeId+"'";			
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
	
	public static boolean updateEmployee(int employeeId, String firstName, String lastName, String email, String mobile, String address) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE employee SET first_name='"+firstName+"', last_name='"+lastName+"',email='"+email+"' ,mobile='"+mobile+"', address='"+address+"' WHERE employee_id = '"+employeeId+"'";
			
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
