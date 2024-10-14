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
            <p class="name">${intObj.firstName} ${intObj.lastName}</p>
            <p class="designation">${intObj.email}</p>
            <p class="designation"><a href="logout.jsp">Logout</a></p>
          </div>
          <ul class="nav">
            <li class="nav-item active">
              <a class="nav-link" href="mainInternDashboard.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="requestLeave.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">Request Leave</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="myLeave.jsp">
                <img src="images/icons/1.png" alt="">
                <span class="menu-title">My Leave</span>
              </a>
            </li>
            
          </ul>
        </nav>

</body>
</html>