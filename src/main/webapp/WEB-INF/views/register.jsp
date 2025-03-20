<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	body{
		background: url("https://www.imageshine.in/uploads/gallery/Free-vector-watercolor-background-Wallpaper.jpg")  no-repeat center center/cover;
		color: white;
	}
	.custom-container{
		width: 40%;
		margin-top: 20px;
		border: 1px solid white;
		border-radius: 5px;
		padding : 10px;
		padding-top: 0px;
		backdrop-filter : blur(8px);
		color: white;
		background: none;
	}
	.custom-container:hover{
		box-shadow: 0px 4px 8px white;
	}
	input{
		padding: 5px 15px;
		background: none;
    	color: white;
    	border: 5px solid white;
    	border-radius: 5px;
	}
	.custom-container input{
		background: none;
    	color: white;
    	border: 1px solid #ccc;
	}
	
	.cus-head{
		color: white;
		text-align: center;
		background-color: blue;
		border-radius: 6px;
	}
	
	input[type="submit"]{
		margin-top: 30px;
		padding : 6px 60px;
		background-color: blue;
	}
	input[type="submit"]:hover{
		box-shadow: 0px 4px 8px white;
	}
	.cus-but{
		text-align: center;
	}
	label{
		margin-top: 15px;
	}
	
	#table{
		margin-top: 20px;
		margin-left: 20px;
	}
</style>
</head>
<body>
	<div class="container custom-container">
		<form action="RegisterCustomer" method="post">
			<div class="row cus-head"><h2>Registration Form</h2></div>
			<div class="row">
				<div class="col"><label class="label">First Name : </label><input  type="text" name="firstName" required></div>
				<div class="col"><label class="label">Last Name : </label><input  type="text" name="lastName" required></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Mobile Number : </label><input  type="tel" pattern="[0-9]{10}" name="mobileNumber" required></div>
				<div class="col"><label class="label">Email : </label><input type="email" name="email" required></div>
			</div>
			<div class="row">
				<div class="col">
                        <div id="gender">
                        <label class="label">Gender</label><br>
                        <input type="radio" class="radio" value="Male" name="gender" required>
                        <label>Male</label>
                        <input type="radio" class="radio" value="Female" name="gender" style="margin-left: 20px;" required>
                        <label>Female</label>
                        </div>
                </div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Aadhaar Number : </label><input type="password" pattern="[0-9]{12}" name="aadhaarNum" required></div>
				<div class="col"><label class="label">PAN Number : </label><input type="password" pattern="{12}" name="panNum" required></div>
			</div>
			<div id="table" class="row">
				<table>
				<tbody>
					<div class="col">
						<tr>
							<td><label class="label">Address</label></td>
							<td><input type="text" name="address" required></td>
						</tr>
					</div>
					<div class="col">
						<tr>
							<td><label class="label">Occupation/Work</label></td>
							<td><input type="text" name="work" required></td>
						</tr>
					</div>
					
				</tbody>
			</table>
			</div>
			
			<div class="row cus-but">
				<div class="col"><input class="btn btn-primary" type="submit" value="submit"></div>
			</div>
		</form>
	</div>
</body>
</html>