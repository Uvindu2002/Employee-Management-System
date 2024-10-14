<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="com.model.AdminModel"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

		<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
          <div class="user-info">
            <img src="images/face.jpg" alt="">
            <p class="name">${adminObj.firstName} ${adminObj.lastName}</p>
            <p class="designation">${adminObj.email}</p>
            <p class="designation"><a href="logout.jsp">Logout</a></p>
          </div>
          <ul class="nav">
            <li class="nav-item active">
              <a class="nav-link" href="mainAdminDashboard.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="admins.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Admins</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="employees.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Employees</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Interns.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Interns</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="addAdmin.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Add Admin</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="applyEmployee.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Apply Employee</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="applyIntern.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Apply Interns</span>
              </a>
            </li>
            
            <li class="nav-item active">
              <a class="nav-link" href="bonus.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Bonus</span>
              </a>
            </li>
            <li class="nav-item active">
		              <a class="nav-link" href="acceptInternLeave.jsp">
		                <img src="images/icons/1.png" alt="">
		                <span class="menu-title">Confirm Intern Leave</span>
		              </a>
		            </li>
		            <li class="nav-item active">
		              <a class="nav-link" href="acceptEmployeeLeave.jsp">
		                <img src="images/icons/1.png" alt="">
		                <span class="menu-title">Confirm Employee Leave</span>
		              </a>
		            </li>
            
            
            
            
          </ul>
        </nav>

</body>
</html>