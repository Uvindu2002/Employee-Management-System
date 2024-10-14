<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
    <%
	        Connection con = null;
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/login.css">
    <link rel="stylesheet" href="css/form.css">
    
    <style type="text/css">
    
    .card-back {
    	background-color: rgb(255, 255, 255, 0.2);
    	border-bottom: 4px solid #65B741;
    	border-radius: 10px;
    
    }
    
    .text-color {
    	color: #fff;
    }
    </style>
</head>
<body>
	
	
	<section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 ">
            
                <div class="card form card-back" id="form1">
                        <div class="text-color">
                            <h3>Intern Application</h3>
                        </div>
                        <br>
                        <form method="post" action="/EmployeeManagement/InternApplyServelet">
						    <div class="row">
						        <div class="col-md-6">
						            <div class="form-group text-color">
						                <label for="firstName">First Name</label>
						                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name">
						            </div>
						            <div class="form-group text-color">
						                <label for="exampleInputEmail1">Email address</label>
						                <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter email">
						            </div>
						            <div class="form-group text-color">
						                <label for="mobile">Mobile</label>
						                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile">
						            </div>
						            <div class="form-group text-color">
						                <label for="department">Department</label>
						                <select class="form-control" name="department" id="arrival_station">
						                    <% try {
						                        con = DBConnect.getConnection();
						                        String sql = "SELECT * FROM department";
						    
						                        PreparedStatement ps = con.prepareStatement(sql);
						                        ResultSet rs = ps.executeQuery();
						    
						                        while (rs.next()) { %> 
						                            <option value="<%= rs.getInt("department_id") %>"><%= rs.getString("department_name") %></option>
						                    <% }
						                        con.close();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    } %>
						                </select>
						            </div>
						        </div>
						        <div class="col-md-6">
						            <div class="form-group text-color">
						                <label for="lastName">Last Name</label>
						                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name">
						            </div>
						            <div class="form-group text-color">
						                <label for="frequency">Gender</label>
						                <select class="form-control" name="gender">
						                    <option value="">Select Gender</option>
						                    <option value="male">Male</option>
						                    <option value="female">Female</option>
						                </select>
						            </div>
						            <div class="form-group text-color">
						                <label for="address">Address</label>
						                <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address">
						            </div> 
						        </div>
						    </div> 
						    <button type="submit" class="btn btn-success mr-2">Submit</button>  
						    <button type="reset" class="btn btn-outline-success">Cancel</button>
						</form>

                    </div>
            </div>
          </div>  
        </div>
      </section>
      
      <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
    // Function to validate the form
    function validateForm() {
    	
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

  
        var isValid = true;

        // Validate email
        if (email.trim() === "") {
            document.getElementById("emailError").innerHTML = "Email is required";
            isValid = false;
        } else {
            document.getElementById("emailError").innerHTML = "";
        }

        // Validate password
        if (password.trim() === "") {
            document.getElementById("passwordError").innerHTML = "Password is required";
            isValid = false;
        } else {
            document.getElementById("passwordError").innerHTML = "";
        }

        return isValid;
    }

    // Add event listener to form submission
    document.getElementById("loginForm").addEventListener("submit", function(event) {
        // Prevent form submission if validation fails
        if (!validateForm()) {
            event.preventDefault();
        }
    });
</script>
	
	

</body>
</html>