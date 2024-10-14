<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
    body {
        margin: 0; /* Remove default margin */
        padding: 0; /* Remove default padding */
        background-image: url('./img/onbordBackground.jpg'); /* Replace 'your_image_path.jpg' with the path to your image */
        background-size: cover; /* Ensure the background image covers the entire viewport */
        background-position: top; /* Center the background image */
        position: relative;
    	background-repeat: no-repeat;
    	height: 100vh;
    }

    .OnBoard-background {
        width: 100%;
        height: 100%;
        opacity: 0.5; /* Adjust the opacity of the background */
    }

    .button-container {
        position: absolute;
        top: 20px; /* Adjust top position as needed */
        right: 20px; /* Adjust right position as needed */
    }

    .button {
        background-color: #007bff; /* Button background color */
        color: white; /* Button text color */
        padding: 10px 20px; /* Adjust padding as needed */
        border: none;
        border-radius: 5px;
        margin-left: 10px; /* Adjust margin between buttons */
        cursor: pointer;
    }
    
    .center-sentence {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        font-size: 36px; /* Adjust font size as needed */
        color: #fff; /* Text color */
        background-color: rgb(255,255,255,0.2);
        border-radius: 20px;
    }
</style>
</head>
<body>

<div class="OnBoard-background"></div>

<div class="button-container">
    <button onclick="window.location.href = 'employeeApply.jsp'" class="button">Apply Employee</button>
    <button onclick="window.location.href = 'internApply.jsp'" class="button">Apply Intern</button>
    <button onclick="window.location.href = 'login.jsp'" class="button">Log In</button>

</div>

<div class="center-sentence">
    <h1>Employee Management System</h1>
</div>

</body>
</html>
