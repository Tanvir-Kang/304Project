<!-- TANVIR -->






<!-- TANVIR -->
<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration Page</title>
</head>
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
</body>
</html>