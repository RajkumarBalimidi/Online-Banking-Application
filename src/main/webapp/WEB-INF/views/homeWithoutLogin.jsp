<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Money Bank Home Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Top Menubar Styling */
        body{
        	color: white;
        	background-color: black;
        }
        .top-menu {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #007bff;
            padding: 15px;
            color: white;
            position: sticky;
    		top: 1px;
        }
        .top-menu img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .top-menu h2 {
            margin: 0;
            flex-grow: 1;
            text-align: center;
        }
        .top-menu a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: bold;
        }
        
        /* Bottom Menubar Styling */
        .bottom-menu {
            background-color: #343a40;
            padding: 10px;
            text-align: center;
        }
        .bottom-menu a {
            color: white;
            margin: 0 10px;
            font-size: 20px;
        }

        /* Page Content Styling */
        .content {
            display: flex;
            padding: 30px;
            flex-wrap: wrap;
        }
        .content img {
            width: 50%;
            height: auto;
        }
        .content .text {
            width: 50%;
            padding: 20px;
        }
        .content h3 {
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .top-menu a{
        	padding : 6px 12px;
        }
        .top-menu a:hover{
        	background-color: white;
        	color: blue;
			border-radius: 5px;
        }
        
        
    </style>
</head>
<body>

    <!-- Top Menubar -->
    <div class="top-menu">
        <img src="https://static.vecteezy.com/system/resources/previews/000/291/402/original/bank-vector-icon.jpg" alt="Bank Logo">
        <h2>Hello! Welcome to the Save Money Bank</h2>
        <div>
        	<a href="Home">Home</a>
            <a href="Login">Login</a>
            <a href="Register">Signup</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <img src="https://media.istockphoto.com/id/1277143096/id/foto/tanda-bank-pada-bangunan-kaca-modern-render-3d.jpg?s=170667a&w=0&k=20&c=yZnHWAKP_PL3EO1L0_5tSOrHQHh2nRKI8pVqh5SLNX8=" alt="Bank Image">
        <div class="text">
            <h3>Bank Summary</h3>
            <p>Save Money Bank is a trusted financial institution providing secure banking services.</p>

            <h3>Bank Details</h3>
            <p>Founded in 2000, Save Money Bank has millions of customers worldwide, ensuring financial security.</p>

            <h3>Bank Registration Process</h3>
            <p>Register online or visit a branch with ID proof, address proof, and a passport-sized photo.</p>

            <h3>Bank Policies</h3>
            <p>Our policies focus on security, privacy, and customer satisfaction with transparent banking.</p>

            <h3>Bank Loan Types and Interest Rates</h3>
            <ul>
                <li><strong>Personal Loan:</strong> 10.5% - 14.5% interest</li>
                <li><strong>Home Loan:</strong> 6.5% - 8.5% interest</li>
                <li><strong>Car Loan:</strong> 7.5% - 9.5% interest</li>
                <li><strong>Education Loan:</strong> 8.0% - 10.0% interest</li>
            </ul>

            <h3>Bank Fixed Deposit and Its Interest</h3>
            <p>We offer attractive FD rates:</p>
            <ul>
                <li>1 Year: 3.5%</li>
                <li>2 Years: 4.0%</li>
                <li>3 Years: 4.5%</li>
                <li>4 Years: 5.0%</li>
                <li>5 Years: 5.5%</li>
                <li>>5 Years: 6.0%</li>
            </ul>

            <h3>Transfer Money from One Bank Account to Another</h3>
            <p>Customers can transfer money using **NEFT, RTGS, IMPS, and UPI** services instantly.</p>

            <h3>Transaction History Checking</h3>
            <p>View your **transaction history** via net banking, mobile banking, or bank statements.</p>

            <h3>Customer Profile Edit Option</h3>
            <p>Update mobile number, occupation, and address easily in your profile settings.</p>
        </div>
    </div>

    <!-- Bottom Menubar (Social Links) -->
    <div class="bottom-menu">
        <a href="https://www.instagram.com" target="_blank"><i class="fa-brands fa-instagram"></i></a>
        <a href="https://www.youtube.com" target="_blank"><i class="fa-brands fa-youtube"></i></a>
        <a href="https://www.twitter.com" target="_blank"><i class="fa-brands fa-twitter"></i></a>
        <a href="https://www.facebook.com" target="_blank"><i class="fa-brands fa-facebook"></i></a>
        <a href="https://www.linkedin.com" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
    </div>

</body>
</html>
