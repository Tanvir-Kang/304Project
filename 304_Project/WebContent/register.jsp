<<<<<<< HEAD
<!-- ZACH







ZACH -->
=======
<!-- TANVIR -->






<!-- TANVIR -->
<%@ page import="java.sql.*, data.loginDetails"%>
>>>>>>> refs/remotes/origin/productionb
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
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
=======
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration Page</title>
>>>>>>> refs/remotes/origin/productionb
</head>
<<<<<<< HEAD
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
=======
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	S
}
form {
    padding-left: 30px;
}
/* Style the header */
.header {
	padding: 80px;
	text-align: center;
	background: #6FBEE7;
	color: white;
}
>>>>>>> refs/remotes/origin/productionb

<<<<<<< HEAD
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
	
	
	
=======
.header h1 {
	font-size: 40px;
}

nav {
	width: 100%;
	height: 40px;
	background-color: #0D2038;
	overflow: hidden;
	margin-bottom: 30px;
	
}
nav a {
	display: block;
	float: left;
	font-family: sans-serif;
	font-size: 17px;
	color: white;
	padding-top: 11px;
	padding-right: 12px;
	padding-bottom: 30px;
	padding-left: 10px;
	text-decoration: none;
}
nav a:hover {
	background-color: gray;
}
nav a:active {
	background-color: #133054;
}
#outer {
	width: 600px;
}
#inner {
	width: 335px;
	margin: 0 auto;
}
</style>
<body bgcolor="#D3D3D3">
<div class="header">
		<h1>
			<b>BookBids</b>
		</h1>
		<p>Registration</p>
	</div>
	<div class="topnav"></div>
	<nav>
		<a href="homepage.html">Home</a>
		</nav>
	<form>
		Please choose a username:
			<input type="text" placeholder="Username" name="Username" ><br><br>
		Choose a password: 
			<input type="password" placeholder="Password" name="Password" required><br><br>
		First name:
			<input type="text" placeholder="Firstname" name="Firstname"><br><br>
		Last name:
			<input type="text" placeholder="Lasttname" name="Lastname"><br><br>
		Email Address: 
			<input type="email" placeholder="example@hotmail.com" name="email"><br><br>
		Enter your birthday (year-month-date):
			<input type="date" placeholder="birthdate" name="bday" min="2000-01-01"><br><br>
			
			<input type="submit" value="Submit"><input type="reset" value="Reset">
	</form>
	
	</body>
	</html>
<%

try { 
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
	out.println("ClassNotFoundException: " + e);
}
loginDetails ld = new loginDetails();
String url = ld.getUrl();
String uid = ld.getUid();
String pw = ld.getPw();

try(Connection con = DriverManager.getConnection(url, uid, pw);){
	
}
catch(SQLException ex){
	out.println(ex);
	
}
%>
>>>>>>> refs/remotes/origin/productionb
</body>
</html>