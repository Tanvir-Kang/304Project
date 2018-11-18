<!-- ZACH -->






<!-- ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	S
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

.header h2 {
	font-size: 30px;
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
</style>
</head>
<body>
	<div class="header">
		<h1>
			<b>BookBids</b>
		</h1>
		<p>Watch the bids start rolling in.</p>
	</div>
	<h2 align="center" style="font-family: Arial;">Sign In</h2>

	<form method="get" action="auction.jsp">
		<p>
			<label for="userName"> <span>Username:</span> <input
				type="text" id="usern" name="userName" size="50">
			</label>
		</p>
		<p>
			<label for="pw"> <span>Password:</span> <input
				type="password" id="pw" name="password" size="50">
			</label> <label><input type="submit" value="Submit"></label> <label><input
				type="reset" value="Reset"></label>
		</p>
	</form>

</body>
</html>