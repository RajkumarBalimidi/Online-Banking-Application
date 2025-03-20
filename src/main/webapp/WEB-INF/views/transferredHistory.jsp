<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.TransactionHistory,com.online.banking.entity.Customer,
 java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transferred History</title>
<style>
body {
    font-family: Arial, sans-serif;
    /* background-color: #f4f4f4; */
    margin: 0;
    padding: 0;
    background: url("https://www.imageshine.in/uploads/gallery/Free-vector-watercolor-background-Wallpaper.jpg")  no-repeat center center/cover;
}

#menubar {
    background-color: #007bff;
    color: white;
    padding: 5px;
    display: flex;
    align-items: center;
}
#menubar h1{
	text-align: center;
	margin-left: 300px;
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

#transList {
    margin: 20px auto;
    width: 80%;
    background: white;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
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
h3{
	color: red;
	text-align: center;
}
</style>
</head>
<body>
	<%Customer c = (Customer) session.getAttribute("customer");%>
	
	<%if(c != null){ %>
		<%List<TransactionHistory> transHisList = (List<TransactionHistory>) session.getAttribute("transHisList"); %>
	<div>
		<div id="menubar">
			<a href="Home">Home</a>
			<h1>Transferred History</h1>
		</div>
		<div id="transList">
			<table>
				<thead>
					<th>Transferred Id</th>
					<th>From Account Number</th>
					<th>From Account Holder Name</th>
					<th>To Account Number</th>
					<th>To Account Holder Name</th>
					<th>To Holder Mobile</th>
					<th>Date</th>
					<th>Amount</th>
				</thead>
				<%if(transHisList != null){ %>
				<%for(TransactionHistory tranHis : transHisList){ %>
					<tbody>
						<tr>
							<td><%= tranHis.getThid() %></td>
							<td><%=tranHis.getTransferredDetails().getAccNo() %></td>
							<td><%=tranHis.getFromName() %></td>
							<td><%=tranHis.getReceivedDetails().getAccNo() %></td>
							<td><%=tranHis.getToName() %></td>
							<td><%=tranHis.getToMobile() %></td>
							<td><%=tranHis.getDate() %></td>
							<td><%=tranHis.getAmount() %></td>
						</tr>
					</tbody>
				<%} 
				}else{
				%>
					<h3>No Transactions are Happened</h3>
				<%} %>
			</table>
		</div>
	</div>
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>