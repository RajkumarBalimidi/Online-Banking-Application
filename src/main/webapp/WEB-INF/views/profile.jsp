<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	body{
		background: url("https://www.imageshine.in/uploads/gallery/Free-vector-watercolor-background-Wallpaper.jpg")  no-repeat center center/cover;
		color: white;
	}
	.custom-container{
		width: 40%;
		margin-top: 20px;
		margin-bottom: 20px;
		border: 1px solid white;
		border-radius: 5px;
		padding : 10px;
		padding-top: 0px;
	}
	.cus-head{
		color: black;
		text-align: center;
		background-color: white;
		border: 1px solid white;
		border-radius: 5px;
	}
	input{
		border: 1px solid white;
		background: none;
		color: white;
		padding : 5px 15px;
		border-radius: 5px;
	}
	
	input[type="submit"]{
		margin-top: 30px;
		padding : 6px 60px;
		color: white;
		background-color: none;
		border: 1px solid white;
	}
	input[type="number"]:readonly{
		background-color: rgb(209, 209, 209);
		cursor: not-allowed;
	}
	.cus-but{
		text-align: center;
	}
	label{
		margin-top: 15px;
	}
	.btn:hover{
		background-color: white;
		color: black;
		border: 2px solid white;
		box-shadow: 0px 4px 8px white;
	}
	#table{
		margin-top: 20px;
		margin-left: 10px;
	}
</style>
</head>
<body> 
	<%Customer customer = (Customer) session.getAttribute("customer"); %>
	<%if(customer != null){ %>
	<div class="container custom-container">
		<form action="EditCustomer" method="post">
			<div class="row cus-head"><h2>Profile Page</h2></div>
			<div class="row">
				<div class="col"><label class="label">Account Number : </label><input type="text" value="<%=customer.getAccNo() %>" name="accNo" readonly></div>
				<div class="col"><label class="label">Account Created Date : </label><input type="datetime"  value="<%= customer.getDate() %>" name="date" readonly></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">First Name : </label><input type="text" value="<%=customer.getFirstName() %>" name="firstName"></div>
				<div class="col"><label class="label">Last Name : </label><input type="text" value="<%=customer.getLastName() %>" name="lastName"></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Mobile Number : </label><input type="tel" pattern="[0-9]{10}" value="<%=customer.getMobileNumber() %>" name="mobileNumber" required></div>
				<div class="col"><label class="label">Email : </label><input type="email" value="<%=customer.getEmail() %>" name="email"></div>
			</div>
			<div class="row">
			    <div class="col">
			        <div id="gender">
			            <label class="label">Gender</label><br>
			            <input type="radio" class="radio" value="Male" name="gender" <%= customer.getGender().equals("Male") ? "checked" : "" %>>
			            <label>Male</label>
			            <input type="radio" class="radio" value="Female" name="gender" <%= customer.getGender().equals("Female") ? "checked" : "" %> style="margin-left: 20px;">
			            <label>Female</label>
			        </div>
			    </div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Aadhaar Number : </label><input id="aadhaarNum" type="text" value="<%=customer.getAadhaarNumber() %>" readonly></div>
				<div class="col">
				    <label class="label">PAN Number :</label>
				    <input id="panNum" type="text" 
				        value="<%= customer.getPanNumber()%>" readonly>
				</div>

			</div>
			
			
			
			
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    function maskNumber(inputId) {
	        let inputField = document.getElementById(inputId);
	        if (!inputField) return; // If input field doesn't exist, exit function
	        
	        let originalValue = inputField.value;

	        if (inputId === "aadhaarNum" && originalValue.length === 12) {
	            inputField.value = "********" + originalValue.slice(-4);
	        } else if (inputId === "panNum" && originalValue.length === 10) {
	            inputField.value = "**********";
	        }
	    }

	    // Apply masking when the page loads
	    maskNumber("aadhaarNum");
	    maskNumber("panNum");
	});

</script>
			
			
			<div id="table" class="row">
				<table>
				<tbody>
					<div class="col">
						<tr>
							<td><label class="label">Address</label></td>
							<td><input type="text" value="<%=customer.getAddress() %>" name="address"></td>
						</tr>
					</div>
					<div class="col">
						<tr>
							<td><label class="label">Occupation/Work</label></td>
							<td><input type="text" value="<%=customer.getWork() %>" name="work" required></td>
						</tr>
					</div>
					
				</tbody>
			</table>
			</div>
			
			
			
			
			
			<div class="row cus-but">
				<div class="col"><input class="btn" type="submit" value="Edit"></div>
			</div>
		</form>
	</div>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>