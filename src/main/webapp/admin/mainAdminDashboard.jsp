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
          <h3 class="page-heading mb-4">Info</h3>
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-danger">
                        <i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Visitors</p>
                      <h4 class="bold-text">65,650</h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-exclamation-circle mr-1" aria-hidden="true"></i> 65% lower growth
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-warning">
                        <i class="fa fa-shopping-cart highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Orders</p>
                      <h4 class="bold-text">656</h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-bookmark-o mr-1" aria-hidden="true"></i> Product-wise sales
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-success">
                        <i class="fa fa-dollar highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Revenue</p>
                      <h4 class="bold-text">$65656</h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-calendar mr-1" aria-hidden="true"></i> Weekly Sales
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-primary">
                        <i class="fa fa-twitter highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Followers</p>
                      <h4 class="bold-text">+62,500</h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-repeat mr-1" aria-hidden="true"></i> Just Updated
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <form class="forms-sample" method="post" action="/EmployeeManagement/UpdateEmployeeProfile">
                  <%
                    try {         
                    String mob = adminObj.getId();
			        con = DBConnect.getConnection();
			        String s1 = "select * from admin where admin_id = ?";

					PreparedStatement pstmt = con.prepareStatement(s1);
					pstmt.setString(1, mob); // Use 'nic' variable instead of 'mob'
					ResultSet rs1 = pstmt.executeQuery();
					while (rs1.next()) {
					%>
					
                    <div class="form-group">
                      <label for="exampleInputEmail1">First Name</label>
                      <input type="text" class="form-control p-input" name="firstName" id="firstName"  value="<%= rs1.getString(2)%>" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Last Name</label>
                      <input type="text" class="form-control p-input" name="lastName" id="lastName"  value="<%= rs1.getString(3)%>" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" class="form-control p-input" name="email" id="email" value="<%= rs1.getString(4)%>" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Password</label>
                      <input type="text" class="form-control p-input" name="password" id="password"  value="<%= rs1.getString(5)%>" >
                    </div>               
                    <div class="form-group">
                      <label for="exampleInputEmail1">Mobile</label>
                      <input type="text" class="form-control p-input" name="mobile"  id="mobile" value="<%= rs1.getString(6)%>" >
                    </div>
                    
                    
                    
                    <%
						 }
	                    con.close();
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
		       		%>
                  </form>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5NXz9eVnyJOA81wimI8WYE08kW_JMe8g&callback=initMap" async defer></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/misc.js"></script>
  <script src="js/chart.js"></script>
  <script src="js/maps.js"></script>
</body>

</html>
