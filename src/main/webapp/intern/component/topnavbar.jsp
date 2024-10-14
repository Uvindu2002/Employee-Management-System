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

<nav class="navbar navbar-default col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="bg-white text-center navbar-brand-wrapper">
        
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center">
        <button class="navbar-toggler navbar-toggler d-none d-lg-block navbar-dark align-self-center mr-3" type="button" data-toggle="minimize">
          <span class="navbar-toggler-icon"></span>
        </button>
        <form class="form-inline mt-2 mt-md-0 d-none d-lg-block">
          <input class="form-control mr-sm-2 search" type="text" placeholder="Search">
        </form>
        <ul class="navbar-nav ml-lg-auto d-flex align-items-center flex-row">
          <li class="nav-item">
            <a class="nav-link profile-pic" href="#"><img class="rounded-circle" src="images/face.jpg" alt=""></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa fa-th"></i></a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-dark navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
    </nav>

</body>
</html>