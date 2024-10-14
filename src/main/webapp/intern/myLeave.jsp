<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="com.model.InternModel"%>

<%
	        Connection con = null;
	%>
    
    <%
    InternModel adminObj = (InternModel) session.getAttribute("intObj");
    
    if (session.getAttribute("intObj") == null) {
        // user is not logged in, redirect to login page
        response.sendRedirect("../login.jsp");
    }
        %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin</title>
  <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" href="node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />
  <link rel="stylesheet" href="node_modules/flag-icon-css/css/flag-icon.min.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="shortcut icon" href="images/favicon.png" />
</head>

<body>
  <div class=" container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@ include file="./component/topnavbar.jsp" %>

    <!-- partial -->
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-right">
        <!-- partial:partials/_sidebar.html -->
        <%@ include file="./component/sidebar.jsp" %>

        <!-- partial -->
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">My Leaves</h3>
          <div class="row mb-2">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table center-aligned-table">
                      <thead>
                        <tr class="text-primary">
                          <th>Reason</th>
                          <th>Date</th>
                          <th>Days</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                       <%
                       try {
                    	   int mob = adminObj.getInternId();
                           con = DBConnect.getConnection();
                           String sql = "SELECT * FROM internleave where employee_id = ?";

                           PreparedStatement ps = con.prepareStatement(sql);
                           ps.setInt(1, mob); 
                           ResultSet rs = ps.executeQuery();

                           while (rs.next()) { 
                        	   String id = rs.getString(1);
                        	   int status = rs.getInt(6); 
                        %>
                        <tr class="">
                          <td><%=rs.getString(2)%></td>
                          <td><%=rs.getString(5)%></td>
                          <td><%=rs.getString(3)%></td>
                          <%
						        // Conditionally render the "Manage" button based on the status
						        if (status == 1) {
						%>
						    <td><a href="manageLeave.jsp?id=<%=id%>" class="btn btn-primary btn-sm">Manage</a></td>
						<%
						        } else {
						%>
						    <td></td> <!-- Empty cell if status is not 1 -->
						<%
						        }
						%>
                          <td><a href="deleteLeave.jsp?id=<%=id%>" class="btn btn-danger btn-sm">Remove</a></td>
                        </tr>
                        <%
                                 }
                                 con.close();
                             } catch (Exception e) {
                                 e.printStackTrace();
                             }
                         %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </div>
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="float-right">
                <a href="#">Employee System</a> &copy; 2024
            </span>
          </div>
        </footer>

        <!-- partial -->
      </div>
    </div>

  </div>

  <script src="node_modules/jquery/dist/jquery.min.js"></script>
  <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
  <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/misc.js"></script>
  <script src="js/chart.js"></script>
  <script src="js/maps.js"></script>
</body>

</html>
