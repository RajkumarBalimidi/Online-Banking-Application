<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer, 
    com.online.banking.hm.LoanHiberManager, 
    com.online.banking.entity.LoanHistory,
    java.util.List,
    java.util.Collections,
 	java.util.Comparator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan History</title>
<style>
    /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: black;
    margin: 0;
    padding: 20px;
    text-align: center;
    color: white;
}

/* Header Styling */
#menubar {
    display: flex;
    align-items: center;
    padding: 15px 20px;
    background-color: #007bff;
    color: white;
}
#menubar a{
	color: white;
	text-decoration: none;
}
#menubar a:hover{
	text-decoration: underline;
}
#menubar h1 {
    margin: 0;
    font-size: 24px;
    flex-grow: 1;
    text-align: center;
}

/* Container */
.container {
    width: 150%;
    max-width: 1500px;
    margin: auto;
    background: black;
    padding: 20px;
    border-radius: 8px;
    color: black;
}
.container:hover{
	box-shadow: 0px 4px 8px rgba(11, 29, 227, 0.894);
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: white;
    border-radius: 8px;
    overflow: hidden;
}

/* Table Headers */
th {
    background-color: #007bff;
    color: white;
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

/* Table Cells */
td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

/* Alternating Row Colors */
tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Hover Effect */
tr:hover {
    background-color: #ddd;
    transition: 0.3s;
}

/* No Loan Message */
.no-loan {
    font-size: 20px;
    color: red;
    margin-top: 20px;
}

/* Links Styled as Buttons */
a {
    text-decoration: none;
    padding: 8px 15px;
    display: inline-block;
    border-radius: 5px;
    transition: 0.3s;
}

/* "View History" Link Styling */
a[href*="ViewLoanPaidHistory"] {
    background-color: #28a745;
    color: white;
    border: 1px solid #28a745;
}

a[href*="ViewLoanPaidHistory"]:hover {
    background-color: #218838;
}

/* "Pay Now" Link Styling */
a[href*="PayLoanNow"] {
    background-color: #dc3545;
    color: white;
    border: 1px solid #dc3545;
}

a[href*="PayLoanNow"]:hover {
    background-color: #c82333;
}
#laonClear{
	color: red;
}

</style>
</head>
<body>
        <% 
        Customer c = (Customer) session.getAttribute("customer");
        
        int accNo = c.getAccNo();
        LoanHiberManager hm = new LoanHiberManager();
        List<LoanHistory> lHisList = hm.getLoanHistoryByAccNo(accNo);
        Collections.sort(lHisList, Comparator.comparing(LoanHistory::getDate).reversed());
        %>
        
        <%if(c != null){ %>
        	<div class="container">
    	<div id="menubar">
    		<a href="Home">Home</a>
        	<h1>Loan History Page</h1>
    	</div>


        <% if (lHisList != null && !lHisList.isEmpty()) { %>

            <table>
                <thead>
                    <tr>
                        <th>Loan Id</th>
                        <th>Account No</th>
                        <th>Holder Name</th>
                        <th>Mobile Number</th>
                        <th>Loan Type</th>
                        <th>Loan Amount</th>
                        <th>Date</th>
                        <th>Rate of Interest</th>
                        <th>Interest Amount</th>
                        <th>Total Loan Amount</th>
                        <th>Paid Loan</th>
                        <th>Pending Loan</th>
                        <th>Surity Acc/No</th>
                        <th>Surity Name</th>
                        <th>Status</th>
                        <th>Paid History</th>
                        <th>Pay Loan</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (LoanHistory loan : lHisList) { %>
                        <tr>
                            <td><%= loan.getLoanId() %></td>
                            <td><%= loan.getCustomer1().getAccNo() %></td>
                            <td><%= loan.getAccHolderName() %></td>
                            <td><%= loan.getMobileNumber() %></td>
                            <td><%= loan.getLoanType()%></td>
                            <td><%= loan.getLoanAmount() %></td>
                            <td><%= loan.getDate()%></td>
                            <td><%= loan.getRateforOneYear() %></td>
                            <td><%= loan.getInterestAmount()%></td>
                            <td><%= loan.getTotalLoanAmount() %></td>
                            <td><%= loan.getPaidLoan() %></td>
                            <td><%= loan.getRemainingLoan() %></td>
                            <td><%= (loan.getCustomer2() != null) ? loan.getCustomer2().getAccNo() : "N/A" %></td>
                            <td><%= loan.getSurityName() %></td>
                            <td><%= loan.getStatus() %></td>
                            <td><a href="ViewLoanPaidHistory?lid=<%= loan.getLoanId()%>">View Paid History</a></td>
                            <td>
                            	<p id="laonClear">${loanCleared}</p>
                            	<a href="PayLoanNow?lid=<%= loan.getLoanId()%>">Pay Now</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

        <% } else { %>
            <h2 class="no-loan">You have not taken any loans.</h2>
        <% } %>

    </div>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
        
    

</body>
</html>
