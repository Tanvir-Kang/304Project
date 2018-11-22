<!-- TANVIR

THIS PAGE WILL:
1. LIST ALL CUSTOMERS
2. DELETE CUSTOMERS WITH BAD REVIEWS AFTER ADMIN READS REVIEWS
3. SHOW CUSTOMER REVIEWS 
4. LIST ALL ORDERS/AUCTIONS WITH DETIALS



TANVIR -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN OPERATIONS</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}
.entry {
	font-family: Arial;
	font-size: 16px;
	font-weight: normal;
	color: #707070;
}
.header {
	padding: 80px;
	text-align: center;
	background: #6FBEE7;
	color: white;
}

.header h1 {
	font-size: 40px;
	font-weight: bolder;
}

.header h2 {
	font-size: 30px;
	color: #0D2038;
}

form {
	margin: 30px;
	width: 350px;
}

label {
	margin-bottom: 20px;
	padding-right: 20px;
	padding-bottom: 10px;
}
nav {
	width: 100%;
	height: 40px;
	background-color: #0D2038;
	overflow: hidden;
}

nav a {
	display: block;
	float: left;
	font-family: sans-serif;
	font-size: 17px;
	color: white;
	padding-top: 11px;
	padding-right: 12px;
	padding-bottom: 11px;
	padding-left: 10px;
	text-decoration: none;
}

nav a:hover {
	background-color: gray;
}

nav a:active {
	background-color: #133054;
}

</style>
</head>
<body>
<div class="header">
		<h1>
			BookBids
		</h1>
		<p>ADMIN FUNCTIONS</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.html">Home</a> 
		
	</nav>
	
	<h2 align="center" style="font-family: Arial;" style="color:#0D2038">Admin operations:</h2>

	<div align="center">Select one of the following functions </div>
	
<form action="userOperations.jsp">
    <input type="submit" value="User operations" />
</form>	
<form action="auctionOperations.jsp">
    <input type="submit" value="Auction operations" />
</form>	
</body>
</html>