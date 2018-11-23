<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<%@ page import="data.loadData" %>

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

.header {
	padding: 80px;
	text-align: center;
	background: #FF0000;
	color: white;
}
.header h1 {
	font-size: 40px;
	font-weight: bolder;
}
nav {
	width: 100%;
	height: 40px;
	background-color: #000000;
	overflow: hidden;
}
.nohover {
	
}

.nohover:hover {
	background-color: #0D2038;
}
nav a {
	display: flex;
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

nav a.active {
	background-color: #000000;
}

nav input[type=text] {
	float: center;
	padding: 6px;
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	margin-right: 16px;
	font-size: 17px;
	margin-bottom: 4px;
}

nav .search-container button {
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 0px;
	background: #e1612f;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

nav .search-container button:hover {
	background: #ccc;
}

.nav-right {
	float: right;
}

#outer {
	width: 600px;
}

#inner {
	width: 450px;
	margin: 0 auto;
}
input{padding: 10px;}
form{padding: 10px;}

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