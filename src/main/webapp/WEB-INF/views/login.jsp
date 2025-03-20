<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.ui.Model" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f4;
    color: white;
    background: url("https://wallpaperbat.com/img/312976-free-download-log-on-to-your-bank-account-on-a-laptop-logging.png	")  no-repeat center center/cover;
}

.login-container {
    background: none;
    padding: 30px;
    padding-top: 0px;
    border: 1px solid blue;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    backdrop-filter: blur(15px);
}
.login-container:hover{
	box-shadow: 0px 4px 8px white;
}
.input-group {
    margin-bottom: 15px;
}

label {
	padding-left: 0px;
    display: block;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: none;
    color: white;
}

button {
    background: none;
    color: white;
    border: 2px solid white;
    padding: 10px 60px;
    margin-top: 10px;
    margin-left: 20px;
    
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
	color: black;
    background: white;
    box-shadow: 0px 4px 8px white;
}
#crfr{
	margin-top: 30px;
	display: flex;
	justify-content : space-evenly;
}
.error {
    color: red;
    font-size: 14px;
    margin-top: 10px;
}
a{
	color: white;
}
h2{
	color: white;
	background-color: none;
	border: 1px solid blue;
	padding: 5px 20px;
	border-radius: 5px;
}
    	
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login Page</h2>
        <form id="loginForm" action="LoginForm" method="post">
        	<p id="error-message" class="error">${notMatchedEmail}</p>
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            <div id="crfr">
            	 <a href="Register" style="margin-right:40px;">Register</a>
            	 <a href="Forgot" style="margin-left:60px;">Forgot Password?</a>
            </div>
        </form>
    </div>
   	
</body>
</html>
