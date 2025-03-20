<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer, com.online.banking.entity.PaidLoanHistory, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Paid History</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: black;
    margin: 0;
    padding: 0;
    
}

#menubar {
    background-color: #007bff;
    color: white;
    padding: 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
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

#paidList {
    margin: 20px auto;
    width: 80%;
    background-color: black;
    border: 1px solid blue;
    padding: 20px;
    border-radius: 5px;
}

#paidList:hover {
	box-shadow: 0px 4px 8px rgba(11, 29, 227, 0.894);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    text-align: center;
    background-color: white;
}

thead {
    background-color: #007bff;
    color: white;
}

thead th {
    padding: 10px;
    text-align: center;
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

</style>
</head>
<body>
	<%Customer c = (Customer) session.getAttribute("customer"); %>
	<%List<PaidLoanHistory> paidLoanHisList = (List<PaidLoanHistory>)session.getAttribute("paidLoanHisList"); %>
	<%if(c != null){ %>
		<div>
		<div id="menubar">
			<a href="Loan">Back</a>
			<h1>Loan Paid History</h1>
			<a href="Home">Home</a>
		</div>
		<div id="paidList">
			<table>
				<thead>
					<th>Paid Loan Id</th>
					<th>Account Number</th>
					<th>Account Holder Name</th>
					<th>Loan ID</th>
					<th>Date</th>
					<th>Amount</th>
				</thead>
				<%for(PaidLoanHistory paidLoanHis : paidLoanHisList){ %>
					<tbody>
						<tr>
							<td><%= paidLoanHis.getPaidLoanId() %></td>
							<td><%= paidLoanHis.getCustomer().getAccNo()%></td>
							<td><%= paidLoanHis.getAccHolderName()%></td>
							<td><%= paidLoanHis.getLoanHistory().getLoanId()%></td>
							<td><%= paidLoanHis.getDate()%></td>
							<td><%= paidLoanHis.getAmount()%></td>
						</tr>
					</tbody>
				<%} %>
			</table>
		</div>
	</div>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>