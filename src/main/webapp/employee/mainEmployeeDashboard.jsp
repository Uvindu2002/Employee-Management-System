<%@page import="com.model.EmployeeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="com.model.EmployeeModel"%>

<%
	        Connection con = null;
	%>
    
    <%
    EmployeeModel adminObj = (EmployeeModel) session.getAttribute("empObj");
    
    if (session.getAttribute("empObj") == null) {
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
          <h3 class="page-heading mb-4">Dashboard</h3>
          <div class="row">
          
          <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <form class="forms-sample" method="post" action="/EmployeeManagement/UpdateEmployeeProfile">
                  <%
                    try {         
                    int mob = adminObj.getEmployeeId();
			        con = DBConnect.getConnection();
			        String s1 = "SELECT e.*, d.department_name " + // Added space after "department_name"
			                "FROM employee e " +
			                "INNER JOIN department d ON e.Department_department_id = d.department_id " +
			                "WHERE e.employee_id = ?";

					PreparedStatement pstmt = con.prepareStatement(s1);
					pstmt.setInt(1, mob); // Use 'nic' variable instead of 'mob'
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
                      <label for="exampleInputEmail1">Gender</label>
                      <input type="text" class="form-control p-input" name="gender" id="gender"  value="<%= rs1.getString(5)%>" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Mobile</label>
                      <input type="text" class="form-control p-input" name="mobile" id="mobile" value="<%= rs1.getString(6)%>" >
                    </div>                    
                    <div class="form-group">
                      <label for="exampleInputEmail1">Address</label>
                      <input type="text" class="form-control p-input" name="address"  id="address" value="<%= rs1.getString(7)%>" >
                    </div>
                    <div class="form-group">
                      <label for="">Department</label>
                      <input type="text" class="form-control p-input" name="department"  id="department" value="<%= rs1.getString("department_name")%>" readonly>
                    </div>
                    <div class="form-group">
                      <label for="">Basic Salery</label>
                      <input type="text" class="form-control p-input" name="salery"  id="salery" value="<%= rs1.getString(11)%>" readonly>
                    </div>
                    
                    <div class="form-group">
                      <input type="hidden" class="form-control p-input" name="employeeId" value="<%= rs1.getString(1)%>">
                    </div>
                    <div class="form-group">
                      <input type="hidden" class="form-control p-input"  >
                    </div>
                    
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary">Update</button>
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
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/misc.js"></script>
  <script src="js/chart.js"></script>
  <script src="js/maps.js"></script>
</body>

</html>
