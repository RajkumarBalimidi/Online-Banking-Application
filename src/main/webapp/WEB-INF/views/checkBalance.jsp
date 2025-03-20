<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.online.banking.entity.Customer" %>

<%
    // Retrieve customer from session
    Customer c = (Customer) session.getAttribute("customer");

    // If customer is not found, redirect to another page
    if (c == null) {
        response.sendRedirect("ERRORMESSAGE");
        return; // Ensure no further code execution after redirect
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Balance</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background: url("https://www.imageshine.in/uploads/gallery/Free-vector-watercolor-background-Wallpaper.jpg")  no-repeat center center/cover;
    }

    #card {
        width: 300px;
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
    }

    label {
        display: block;
        font-weight: bold;
        margin-top: 15px;
        color: #333;
    }

    input[type="number"],
    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
    }

    input[type="number"]:read-only,
    input[type="text"]:read-only {
        background-color: #f9f9f9;
        color: #555;
        cursor: not-allowed;
    }

    input[type="button"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        margin-top: 20px;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="button"]:hover {
        background-color: #0056b3;
    }

    a {
        text-decoration: none;
    }
</style>
</head>
<body>

<div id="card">
    <label>Account Number:</label>
    <input type="number" value="<%= c.getAccNo() %>" readonly><br>
    
    <label>Account Holder Name:</label>
    <input type="text" value="<%= c.getFirstName() + " " + c.getLastName() %>" readonly><br>
    
    <label>Balance Amount:</label>
    <input type="number" value="<%= c.getAmount() %>" readonly><br>
    
    <a href="Home"><input type="button" value="OK"></a>
</div>

</body>
</html>
