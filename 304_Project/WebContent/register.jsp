<!-- ZACH







ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
	<h2 align="center" style="font-family: Arial;" style="color:#0D2038">Register</h2>

	<div align="center">Required fields marked with <span style="color:red">*</span></div>


	<form method="get" action="registerConfirm.jsp">
		<p>
			<label for="userName">
				<div class ="entry">Username:<span style="color:red">*</span></div> <input type="text" id="usern" name="userName"
				size="50">
			</label>
		</p>
		<p>
			<label for="pw">
				<div class ="entry">Password (at least 6 characters):<span style="color:red">*</span></div> <input type="password"
				id="pw" name="password" size="50">
			</label>
		</p>

		<p>
			<label for="email">
				<div class ="entry">Email Address:<span style="color:red">*</span></div> <input type="email" id="eml" name="email"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" size="50">
			</label>
		</p>
		<p>
			<label for="firstName">
				<div class ="entry">First Name:<span style="color:red">*</span></div> <input type="text" id="fname"
				name="firstName" size="50">
			</label>
		</p>
		<p>
			<label for="lastName">
				<div class ="entry">Last Name:<span style="color:red">*</span></div> <input type="text" id="lname" name="lastName"
				size="50">
			</label>
		</p>
		<p>
			<label for="phoneNum">
				<div class ="entry">Phone Number:</div> <input type="tel" id="pnum" name="phoneNum"
				size="50">
			</label>
		</p>
		<p>
			<label for="birthDate">
				<div class ="entry">Birthdate:</div> <input type="date" id="bdate" name="birthDate"
				size="50">
			</label>
		</p>
		<p align="center">
			<label><input type="submit" value="Register"></label> <label><input
				type="reset" value="Reset"></label>
		</p>

	</form>
	
	
	
</body>
</html>