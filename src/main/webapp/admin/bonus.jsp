<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="com.model.AdminModel"%>

<%
	        Connection con = null;
	%>
    
    <%
    AdminModel adminObj = (AdminModel) session.getAttribute("adminObj");
    
    if (session.getAttribute("adminObj") == null) {
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
          <h3 class="page-heading mb-4">Bonus</h3>
          <button onclick="window.location.href = 'addBonus.jsp'" class="btn btn-success">Add Bonus</button>
          <div class="row mb-2">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table center-aligned-table">
                      <thead>
                        <tr class="text-primary">
                          <th>Employee Name</th>
                          <th>Basic Salery</th>
                          <th>Bonus Amount</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                       <%
                       try {
                           con = DBConnect.getConnection();
                           String sql = "SELECT s.*, e.* FROM salery s INNER JOIN employee e ON s.Employee_employee_id = e.employee_id";

                           PreparedStatement ps = con.prepareStatement(sql);
                           ResultSet rs = ps.executeQuery();

                           while (rs.next()) { 
                        	   String mob = rs.getString("salery_id");
                        %>
                        <tr class="">
                          <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                          <td><%=rs.getString("basic_salery")%></td>
                          <td><%=rs.getString("bonus_amount")%></td>
                          <td><a href="manageBonus.jsp?id=<%=mob%>" class="btn btn-primary btn-sm">Manage</a></td>
                          <td><a href="deleteBonus.jsp?id=<%=mob%>" class="btn btn-danger btn-sm">Remove</a></td>
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
