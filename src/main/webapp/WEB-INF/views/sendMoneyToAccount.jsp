<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money To Account</title>
<style>
	body{
		padding: 0;
		margin: 0;
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		background: url("https://static.vecteezy.com/system/resources/previews/010/518/831/large_2x/digital-finance-and-banking-investment-service-in-futuristic-background-bank-building-with-online-growth-graph-investment-secure-money-and-financial-innovation-technology-vector.jpg")  no-repeat center center/cover;
	}
	div{
		text-align: center;
		border: 1px solid white;
		border-radius: 5px;
		padding : 10px;
		padding-top: 0px;
		color: white;
		backdrop-filter: blur(6px);
	}
	div:hover{
		box-shadow: 0px 4px 8px white;
	}
	h2{
		padding: 10px;
		color: black;
		background-color: white;
		border-radius: 3px;
	}
	#errorMsg{
		text-align: center;
		color: red;
	}
	input{
		color: white;
		background: none;
		padding : 8px 18px;
		border: 2px solid white;
		border-radius: 5px;
	}
	/* input[type="number"]:read-only,input[type="text"]:read-only{
		padding : 6px;
		cursor: not-allowed;
		padding-left: 10px;
		background-color: rgb(240, 240, 240);
		border-radius: 3px;
	}
	input[type="number"],input[type="password"]{
		padding : 6px;
		padding-left: 10px;
	} */
	input[type="submit"]{
		color: white;
		background-color: none;
		margin-top: 30px;
		margin-bottom: 10px;
		cursor: pointer;
		padding: 5px 30px;
		border-radius: 5px;
	}
	input[type="submit"]:hover{
		color: black;
		background-color: white;
		box-shadow: 0px 4px 8px white;
	}
</style>
</head>
<body>

	<%Customer c = (Customer) session.getAttribute("customer");%>
	
	<%if(c != null){ %>
		<%Customer cst = (Customer) session.getAttribute("ToCustomer"); %>
	<div>
		<form action="TransferredMoneyToAnotherAccount" method="post">
			<h2>Account Details of Transferred Money</h2>
			<p id="errorMsg">${wrongPwdandBalance}</p>
			<table>
				<tbody>
					<tr>
						<td><label>From Account Number</label></td>
						<td><input type="number" value="<%= c.getAccNo()%>" name="fromAccNo" readonly></td>
					</tr>
					<tr>
						<td><label>From Account Holder Name</label></td>
						<td><input type="text" value="<%= c.getFirstName()+" "+c.getLastName() %>" name="fromName" readonly></td>
					</tr>
					<tr>
						<td><label>To Account Number</label></td>
						<td><input type="number" value="<%=cst.getAccNo() %>" name="toAccNo" readonly></td>
					</tr>
					<tr>
						<td><label>To Account Holder Name</label></td>
						<td><input type="text" value="<%= cst.getFirstName()+" "+cst.getLastName() %>" name="toName" readonly></td>
					</tr>
					<tr>
						<td><label>To Mobile Number</label></td>
						<td><input type="number" value="<%= cst.getMobileNumber() %>" name="toMobile" readonly></td>
					</tr>
					<tr>
						<td><label>Enter Amount</label></td>
						<td><input type="number" name="amount" required></td>
					</tr>
					<tr>
						<td><label>Password</label></td>
						<td><input type="password" name="password" required></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="Send Amount">
		</form>
	</div>
	
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>