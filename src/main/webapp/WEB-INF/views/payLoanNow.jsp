<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.hm.LoanHiberManager, 
	com.online.banking.entity.LoanHistory,
	com.online.banking.entity.Customer" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pay Loan Now</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	body{
		 background: url("https://www.cpomagazine.com/wp-content/uploads/2023/02/what-u-s-companies-can-learn-from-the-european-payment-scene_1500.jpg") no-repeat center center/cover;
		 color: white;
	}

	#menubar {
    display: flex;
    align-items: center;
    padding: 15px 20px;
    background-color: #007bff;
    color: white;
    justify-content: space-between;
}
#menubar a{
	color: white;
	text-decoration: none;
}
#menubar a:hover{
	color: white;
	text-decoration: underline;
}
#menubar h1 {
    margin: 0;
    font-size: 24px;
    flex-grow: 1;
    text-align: center;
}

	.custom-container{
		width: 40%;
		margin-top: 20px;
		margin-left: 20px;
		border: 1px solid white;
		border-radius: 5px;
		padding : 10px;
		padding-top: 0px;
		color: white;
		float: left;
	}
	.custom-container:hover{
		box-shadow: 0px 4px 8px white;
	}
	.cus-head{
		color: black;
		text-align: center;
		background-color: white;
		border: 1px solid white;
		border-radius: 5px;
		padding: 10px;
	}
	table {
		width: 100%;
		color: white;
	}
	td, th {
		padding: 8px;
	}
	input {
		border: 1px solid white;
		padding: 5px 15px;
		color: white;
		background: none;
		border-radius: 5px;
	}
	input[type="text"]:readonly, input[type="date"]:readonly {
		background-color: #f9f9f9;
        color: #555;
        cursor: not-allowed;
        background: none;
	}
	input[type="submit"]{
		margin-top: 20px;
		padding: 6px 10px;
		border: 1px solid white;
		color: black;
		background-color: white;
	}
	input[type="submit"]:hover{
		border: 1px solid white;
		box-shadow: 0px 4px 8px white;
	}
	#err-msg{
		margin-top: 5px;
		text-align: center;
		color: red;
	}
</style>
</head>
<body>
	<%Customer c = (Customer) session.getAttribute("customer"); %>
	<% LoanHistory loanHis = (LoanHistory) session.getAttribute("loanId"); %>
	<%if(c != null){ %>
		<div id="menubar">
    		<a href="Loan">Back</a>
        	<h1>Loan History Page</h1>
    		<a href="Home">Home</a>
    	</div>
	<%if(loanHis != null){ %>
		<div class="container custom-container">
			<form action="PayLoan" method="post">
				<div class="row cus-head"><h2>Pay Loan Amount</h2></div>
				<p id="err-msg">${loanPayPwd}</p>
				<table>
					<tr><td><label>Loan ID:</label></td><td><input type="text" value="<%= loanHis.getLoanId() %>" name="loanId" readonly></td></tr>
					<tr><td><label>Account Number:</label></td><td><input type="text" value="<%= loanHis.getCustomer1().getAccNo() %>" name="accNo" readonly></td></tr>
					<tr><td><label>Holder Name:</label></td><td><input type="text" value="<%= loanHis.getAccHolderName() %>" name="holderName" readonly></td></tr>
					<tr><td><label>Pending Loan:</label></td><td><input type="text" value="<%= loanHis.getRemainingLoan() %>" name="remainingLoan" readonly></td></tr>
					<tr><td><label>Pay Amount:</label></td><td><input type="number" name="payAmount"></td></tr>
					<tr><td><label>Password:</label></td><td><input type="password" name="password"></td></tr>
				</table>
				<div class="row text-center">
					<input class="btn" type="submit" value="Pay Loan">
				</div>
			</form>
		</div>
	<%} %>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>
