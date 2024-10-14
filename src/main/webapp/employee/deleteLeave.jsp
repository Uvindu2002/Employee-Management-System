<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			
		    
		    Connection con = null;
		    Statement stmt = null;
		    con = DBConnect.getConnection();
		    stmt = (Statement) con.createStatement();
		    String query;
		    int rowsAffected;
		    
		   
		    	query = "delete from reqleave where leave_id = '" + id + "'";
		    	rowsAffected = stmt.executeUpdate(query);
		    	response.sendRedirect("myLeave.jsp");
		    
		    
		    
		    
		   
		    
		    con.close();
		  
		    
		    
		} catch (Exception e) {
		    e.printStackTrace();
		}
	   
	    
		%>

</body>
</html>