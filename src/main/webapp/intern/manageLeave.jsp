<%@page import="com.model.EmployeeModel"%>
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
          <h3 class="page-heading mb-4">Manage leave</h3>
          <div class="row">
          
          	<div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                
                  <form class="forms-sample" method="post" action="/EmployeeManagement/InternUpdateLeaveServelet">
                  <%
                    try {         
                  	String mob = request.getParameter("id");
			        con = DBConnect.getConnection();
					String s1 = "SELECT * FROM internleave WHERE leave_id = ?";
					PreparedStatement pstmt = con.prepareStatement(s1);
					pstmt.setString(1, mob); // Use 'nic' variable instead of 'mob'
					ResultSet rs1 = pstmt.executeQuery();
					while (rs1.next()) {
					%>
					<input type="hidden" class="form-control p-input" name="leaveId" id="leaveId"  value="<%= rs1.getString(1)%>">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Reason</label>
                      <input type="text" class="form-control p-input" name="reason" id="reason"  value="<%= rs1.getString(2)%>">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">How Many Days</label>
                      <input type="text" class="form-control p-input" name="days" id="days" value="<%= rs1.getString(3)%>">
                    </div>
                    
                    <div class="form-group">
                      <label for="">Request Date</label>
                      <input type="date" class="form-control p-input" name="requestDate" id="requestDate" value="<%= rs1.getString(5)%>">
                    </div>
                    
                    
                    <div class="form-group">
                      <input type="hidden" class="form-control p-input" name="internId" value="<%= rs1.getString(4)%>">
                    </div>
                    
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary">Submit</button>
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
