<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fixed Deposit Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	body{
		background: url("https://static.vecteezy.com/system/resources/previews/010/518/840/non_2x/digital-finance-and-banking-service-in-futuristic-background-bank-building-with-online-payment-transaction-secure-money-and-financial-innovation-technology-vector.jpg")  no-repeat center center/cover;
		color: white;
	}
	.custom-container{
		width: 60%;
		margin-top: 20px;
		margin-bottom: 20px;
		border: 1px solid white;
		border-radius: 5px;
		padding : 10px;
		padding-top: 0px;
		backdrop-filter: blur(10px);
	}
	.custom-container:hover{
		box-shadow: 0px 4px 8px white;
	}
	/* Header Styling */
#menubar {
    background-color: #007bff;
    color: white;
    padding: 5px;
    display: flex;
    align-items: center;
}
#menubar h1{
	text-align: center;
	margin-left: 380px;
}
#menubar a {
	float: left;
    color: white;
    margin: 15px;
    margin-left: 50px;
    text-decoration: none;
    font-weight: bold;
}

#menubar a:hover {
    text-decoration: underline;
}

	
	.cus-head{
		color: white;
		text-align: center;
		background-color: blue;
		border-radius: 5px;
	}
	input{
		color: white;
		background: none;
		border: 2px solid white;
		padding: 5px 20px;
		border-radius: 5px;
	}
	/* input[type="text"],input[type="date"],input[type="tel"],input[type="number"],input[type="password"]{
		border: 1px solid black;
	} */
	input[type="radio"]{
		color: blue;
	}
	input[type="submit"]{
		margin-top: 30px;
		padding : 6px 60px;
		background-color: blue;
	}
	input[type="submit"]:hover{
		color: black;
		background-color: white;
		box-shadow: 0px 4px 8px white;
	}
	.cus-but{
		text-align: center;
	}
	label{
		margin-top: 15px;
	}
	p{
		color: red;
	}
</style>
</head>
<body>
	<%Customer c = (Customer) session.getAttribute("customer");%>
	<%if(c != null){ %>
		<div id="menubar">
			<a href="Home">Home</a>
			<h1>Fixed Deposit</h1>
		</div>
	<div class="container custom-container">
		
		<form action="AddFixedDepositMoney" method="post">
			<div class="row cus-head"><h2>Fixed Deposit Form</h2></div>
			<p>${noOneMatched}</p>
			<div class="row">
				<div class="col"><label class="label">Account Number </label><input type="text" value="<%= c.getAccNo()%>" name="accNo" readonly></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Account Holder Full Name : </label><input type="text" value="<%= c.getFirstName()+" "+c.getLastName()%>" name="fullName" readonly></div>
				<div class="col"><label class="label">Mobile Number : </label><input type="text" value="<%=c.getMobileNumber() %>"  name="mobileNumber" readonly></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Nominee Full Name : </label><input type="text" name="nomineefullName" required></div>
				<div class="col"><label class="label">Nominee Mobile Number : </label><input type="tel" pattern="[0-9]{10}" name="nomineemobileNumber" required></div>
				<div class="col"><label class="label">Nominee DOB : </label><input type="date" name="nomineedateofbirth" required></div>
			</div>
			<div class="row">
				<div class="col"><label class="label">Tenure (Years) : </label><input type="number" name="tenure"></div>
				<div class="col"><label class="label">Aadhaar Number : </label><input type="password" pattern="{12}" name="aadhaarNum"></div>
				<div class="col"><label class="label">Enter your PAN number : </label><input type="password" pattern="{10}" name="panNum"></div>
			</div> 
			<div style="margin-top: 10px;" class="row">
				<div class="col"><label class="label">Amount : </label><input type="number" name="amount" required></div>
				<div class="col"><label class="label">Password : </label><input type="password" name="password" required></div>
			</div>
			<div class="row cus-but">
				<div class="col"><input class="btn btn-primary" type="submit" value="submit"></div>
			</div>
		</form>
	</div>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>