<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.online.banking.entity.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money Search Account Holder</title>
<style>
	body{
		margin : 0px;
		padding : 0px;
		background: url("https://wallpapers.com/images/hd/high-resolution-blue-background-1920-x-1200-m6jsc5n5zpuxc7ev.jpg")  no-repeat center center/cover;
	}
	#menubar {
    background-color: #007bff;
    color: white;
    padding: 5px;
    display: flex;
    align-items: center;
	}
	#menubar h1{
		color: white;
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
	
	#search-body{
		align-items: center;
		width: 300px;
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 10px;
        text-align: center;
        margin-left: 450px;
        margin-top: 100px;
        background: none;
        backdrop-filter: blur(5px);
	}
	#search-body:hover{
		box-shadow: 0px 4px 8px blue;
	}
	form{
		align-item: center;
	}
	h1{
		padding-top: 0px;
		color: white;
	}
	#accNotFound{
		text-align: center;
		font-weight: bold;
		color: red;
	}
	label{
		margin-bottom: 10px;
		color: white;
	}
	input[type="number"]{
		padding : 6px;
		background: none;
		color: white;
		border: 2px solid white;
		border-radius: 5px;
	}
	input[type="submit"]{
		color: black;
		background-color: white;
		padding: 5px 20px;
		margin-top: 15px;
		border-radius: 5px;
		cursor: pointer;
	}
	input[type="submit"]:hover{
		box-shadow: 0px 4px 8px white;
	}
	h2{
		color: white;
	}
</style>
</head>
<body>
	<%Customer c = (Customer) session.getAttribute("customer");%>

	<%if(c != null){ %>
		<div id="menubar">
			<a href="Home">Home</a>
			<h1>Search Account Number</h1>
	</div>
	<div id="search-body">
		<form action="SearchAccountNumber">
			<h2>Search the Account Number</h2>
			<p id="accNotFound">${ toAccNotFound }</p>
			<label>Account Number : </label>
			<input type="number" name="checkAccNo" required><br>
			
			<input type="submit" value="search">
		</form>
	</div>
	
	<%}else{
	    response.sendRedirect("ERRORMESSAGE");
	    
	} %>
	
</body>
</html>