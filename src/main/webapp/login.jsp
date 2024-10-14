<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	
	
	<section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 ">
            
                <div class="contact-h-cont">
                  
                  <form id="loginForm" method="post" action="/EmployeeManagement/AdminLoginServelet">
                  <c:if test="${!empty failMessage}">
            	<div class="alert alert-danger col-md-12 " role="alert">
				  ${failMessage}
				</div>
		    	
			</c:if>
					    <div class="form-group" style="color: #fff;">
					        <label for="email">Email</label>
					        <input type="text" class="form-control" name="email" id="email" placeholder="Enter Email"> 
					        <div id="emailError" class="invalid-feedback"></div> <!-- Error message for email -->
					    </div>  
					    <div class="form-group" style="color: #fff;">
					        <label for="password">Password</label>
					        <input class="form-control" type="password" name="password" id="password" placeholder="Password">
					        <div id="passwordError" class="invalid-feedback"></div> <!-- Error message for password -->
					    </div>   
					    <div class="form-group" style="color: #fff;">
                            <label for="position">Position</label>
                            <select class="form-control" name="position">
			                    <option value="employee">Employee</option>
			                    <option value="intern">Intern</option>
			                    <option value="admin">Admin</option>
			                </select>
                        </div>
					    <button type="submit" class="btn btn-success" role="button">Login</button>
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