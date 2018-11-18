<!-- ZACH -->






<!-- ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}
.entry {
	font-family: Arial;
	font-size: 20px;
	font-weight: normal;
	color: #707070;
}

/* Style the header */
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
	margin: 0 auto;
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
	margin-right: 14px;
	background: #e1612f;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

nav .search-container button:hover {
	background: #ccc;
}
</style>
</head>
<body>

	<div class="header">
		<h1>
			BookBids
		</h1>
		<p>Watch the bids start rolling in.</p>
	</div>
			<nav>
		<a class="active" href="homepage.html">Home</a> <a href="listAuctions.jsp">Auctions</a>
		<a href="login.jsp">Login</a> <a href="register.jsp">Register</a>
		
		<div id="inner" class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="Author, Title, ISBN..."
					name="search">
				<button type="submit">Submit</button>
			</form>
		
		</div>
	</nav>
	
	<h2 align="center" style="font-family: Arial;">Sign In</h2>

	<form method="get" action="auction.jsp">
		<p>
			<label for="userName">
				<div class ="entry">Username:</div> <input type="text" id="usern" name="userName"
				size="50">
			</label>
		</p>
		<p>
			<label for="pw">
				<div class ="entry">Password:</div> <input type="password"
				id="pw" name="password" size="50">
			</label>
		</p>
		<p align="center">
			<label><input type="submit" value="Login"></label> <label><input
				type="reset" value="Reset"></label>
		</p>
	</form>

</body>
</html>