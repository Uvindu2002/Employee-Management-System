<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.connection.DBConnect" %>
<%@ page import= "java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
    Connection con = null;
    Statement stmt = null;
    try {
        int id = Integer.parseInt(request.getParameter("id"));

        con = DBConnect.getConnection();
        con.setAutoCommit(false); // Start a transaction

        // Delete from salary table
        String salaryQuery = "DELETE FROM salery WHERE Employee_employee_id = ?";
        PreparedStatement salaryStmt = con.prepareStatement(salaryQuery);
        salaryStmt.setInt(1, id);
        salaryStmt.executeUpdate();

        // Delete from employee table
        String employeeQuery = "DELETE FROM employee WHERE employee_id = ?";
        PreparedStatement employeeStmt = con.prepareStatement(employeeQuery);
        employeeStmt.setInt(1, id);
        employeeStmt.executeUpdate();

        // Commit the transaction
        con.commit();

        response.sendRedirect("employees.jsp");

    } catch (SQLException e) {
        if (con != null) {
            try {
                con.rollback(); // Rollback the transaction in case of error
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        e.printStackTrace();
    } catch (NumberFormatException e) {
        out.println("Invalid ID parameter.");
    } finally {
        // Close resources
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
