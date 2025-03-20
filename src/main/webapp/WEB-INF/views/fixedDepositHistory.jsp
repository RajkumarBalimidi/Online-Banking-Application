<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer,
 com.online.banking.hm.TransactionHiberManager,
 com.online.banking.entity.FixedDepositHistory,
 java.util.List,
 java.util.Collections,
 java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fixed Deposit History</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: black;
    margin: 0;
    padding: 0;
}

#menubar {
    background-color: #007bff;
    justify-content: space-between;
    color: white;
    padding: 5px;
    display: flex;
    align-items: center;
    width: 100%;
}

#menubar a {
    color: white;
    margin: 15px;
    margin-left: 50px;
    text-decoration: none;
    font-weight: bold;
}

#menubar a:hover {
    text-decoration: underline;
}

#paidList {
    margin: 20px auto;
    width: 100%;
    background: black;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}
#paidList:hover {
	box-shadow: 0px 4px 8px rgba(11, 29, 227, 0.894);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    border-radius: 5px;
    background-color: white;
}

thead {
    background-color: #007bff;
    color: white;
}

thead th {
    padding: 10px;
    text-align: left;
}

tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

tbody td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

tbody tr:hover {
    background-color: #d1ecf1;
}
#errmsg {
	text-align: center;
}
h3{
	color: red;
}
</style>
</head>
<body>
	<div>
		<%Customer c = (Customer)session.getAttribute("customer");
				int accNo = c.getAccNo();
		%>
		<% TransactionHiberManager thm = new TransactionHiberManager(); %>
		<%List<FixedDepositHistory> fdHisList = (List<FixedDepositHistory>) thm.fixedDepositedHistory(accNo);
		Collections.sort(fdHisList, Comparator.comparing(FixedDepositHistory::getFromDate).reversed());
		%>
			
		<%if(c != null){ %>
			<div id="menubar">
			<a href="Home">Home</a>
			<h1>Fixed Deposit History</h1>
			<a href="AddFixedDeposit">Add Fixed Deposit</a>
		</div>
		<div id="paidList">
			<table>
			<%if(fdHisList != null){ %>
				<thead>
					<th>Fixed Deposit ID</th>
					<th>Account Number</th>
					<th>Account Holder Name</th>
					<th>Mobile Number</th>
					<th>Nominee Full Name</th>
					<th>Nominee Mobile Number</th>
					<th>Nominee DOB</th>
					<th>Tenure (Years)</th>
					<th>Fixed Deposit Amount</th>
					<th>Rate of Interest</th>
					<th>Interest Amount</th>
					<th>From Date</th>
					<th>To Date</th>
					<th>Total Fixed Deposit Amount</th>
					<th>Status</th>
				</thead>
				
				<%for(FixedDepositHistory fdHis : fdHisList){ %>
					<tbody>
						<tr>
							<td><%= fdHis.getFixedDepositId()%></td>
							<td><%= fdHis.getCustomer().getAccNo()%></td>
							<td><%= fdHis.getAccHolderName()%></td>
							<td><%= fdHis.getMobileNumber()%></td>
							<td><%= fdHis.getNomineeName()%></td>
							<td><%= fdHis.getNomineeMobile()%></td>
							<td><%= fdHis.getNomineeDOB()%></td>
							<td><%= fdHis.getTenure()%></td>
							<td><%= fdHis.getFixedDepositAmount()%></td>
							<td><%= fdHis.getRateofInterest()%></td>
							<td><%= fdHis.getInterestAmount()%></td>
							<td><%= fdHis.getFromDate()%></td>
							<td><%= fdHis.getToDate()%></td>
							<td><%= fdHis.getTotalAmountFD()%></td>
							<td><%= fdHis.getStatus()%></td>
						</tr>
					</tbody>
				<%}
			}else{%>
			    <div id="errmsg"><h3>You have not done Fixed Deposits</h3></div>
			<%} %>
			</table>
		</div>
		
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
				
		
	</div>
</body>
</html>