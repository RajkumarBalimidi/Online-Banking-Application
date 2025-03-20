<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Money Bank Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Global Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Full-Screen Background */
body {
    background: url('your-image-url.jpg') no-repeat center center/cover;
    height: 80vh;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

/* Top Menubar Styling */
.top-menu {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: blue;
    padding: 15px;
    color: white;
    position: sticky;
    top: 0;
    z-index: 1000;
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
    padding: 6px 12px;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
}

.top-menu a:hover {
    background-color: white;
    color: blue;
}

/* Content Styling */
/* Content Styling */
.content {
    text-align: center;
    font-size: 1.5rem;
    max-width: 100%;
    margin: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* Center content vertically */
    color: white;
    font-family: Arial, sans-serif;
    min-height: 100vh; /* Ensure full screen height */
    width: 100%;
    background: url("https://static.vecteezy.com/system/resources/previews/010/518/840/non_2x/digital-finance-and-banking-service-in-futuristic-background-bank-building-with-online-payment-transaction-secure-money-and-financial-innovation-technology-vector.jpg") no-repeat center center;
    background-size: cover; /* Ensures full coverage */
    background-attachment: fixed; /* Keeps background fixed while scrolling */
    animation: slideUp 2s ease-in-out;
}


/* Quotes List */
.content ul {
    list-style: none;
    padding: 0;
}

.content li {
    margin: 15px 0;
    font-size: 1.2rem;
    opacity: 0;
    animation: fadeIn 1s ease-in-out forwards;
}

/* Animations */
@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

/* Bottom Menubar (Social Links) */
.bottom-menu {
    background-color: #343a40;
    padding: 10px;
    text-align: center;
    position: fixed;
    width: 100%;
    bottom: 0;
}

.bottom-menu a {
    color: white;
    margin: 0 10px;
    font-size: 20px;
    transition: transform 0.3s ease-in-out;
}

.bottom-menu a:hover {
    transform: scale(1.2);
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
    	<ul>
    		<li>💰 "Banking was conceived in iniquity and born in sin." – Josiah Stamp</li>
    		<li>🏦 "A bank is a place that will lend you money if you can prove that you don’t need it." – Bob Hope</li>
    		<li>💳 "The safest way to double your money is to fold it over and put it in your pocket." – Kin Hubbard</li>
    		<li>📈 "It is well enough that people do not understand the banking and monetary system, for if they did, I believe there would be a revolution before tomorrow morning." – Henry Ford</li>
    		<li>💵 "Banks lend by creating credit. They create the means of payment out of nothing." – Ralph M. Hawtrey</li>
    	</ul>
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
