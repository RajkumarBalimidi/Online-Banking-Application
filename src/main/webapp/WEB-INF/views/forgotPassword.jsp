<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<style>
	body{
		background: url("https://static.vecteezy.com/system/resources/previews/001/310/865/non_2x/question-mark-on-dark-blue-background-free-vector.jpg")  no-repeat center center/cover;
		color: white;
	}
	#forgot{
		margin-top: 5%;
		text-align: center;
		background: white;
		width: 300px;
		height: auto;
		padding : 0px;
		align-item: center;
		border-radius: 10px;
		border:1px solid white;
		background: none;
	}
	#forgot:hover{
		box-shadow: 0px 4px 8px white;
	}
	h1{
		padding-top: 0px;
		margin-top: 0px;
		margin-bottom: 0px;
		padding: 10px;
		border-radius: 10px 10px 0px 0px;
		color: white;
		background-color: green;
	}
	input[type="email"],input[type="password"]{
		margin-bottom: 15px;
		padding: 10px 35px;
		background: none;
		color: white;
		border: 1.5px solid white;
		border-radius: 5px;
	}
	input[type="submit"]{
		margin-top: 10px;
		margin-bottom: 15px;
		color: white;
		background-color: green;
		border-radius: 10px;
		padding: 10px 50px;
	}
	#error-msg{
		color: red;
		text-align: center;
	}
	label{
		font-weight: bold;
	}
</style>
</head>
<body>
	<center>
		<div id="forgot">
			<form action="ForgotPassword" method="post">
				<h1>Set Password</h1><br>
				<p id=error-msg>${notMatchedPwd}</p>
				<label>Email : </label><br><input type="email" name="email" id="email" required><br>
				<label>New Password : </label><br><input type="password" name="npassword" id="npassword" required><br>
				<label>Confirm Password : </label><br><input type="password" name="cpassword" id="cpassword" required><br>
				<input type="submit" value="Reset">
			</form>
		</div>
	</center>
	
</body>
</html>