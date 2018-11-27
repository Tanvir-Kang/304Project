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
	text-align: center;
}

label {
	margin-bottom: 20px;
	padding-right: 20px;
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>

	<h2 align="center" style="font-family: Arial;">Sign In</h2>
	<%
		// Print prior error login message if present
		if (session.getAttribute("loginMessage") != null){
			out.println("<p align='center' style='color:red;'><b>" + session.getAttribute("loginMessage").toString()
					+ "</b></p>");
			session.removeAttribute("loginMessage");
		}
	%>
	<%
		// Print logout message if logged out
		if (session.getAttribute("logoutMessage") != null){
			out.println("<p align='center' style='color:red;'>" + session.getAttribute("logoutMessage").toString()
					+ "</p>");
			session.removeAttribute("logoutMessage");
		}
	%>
	<form method="post" action="validateLogin.jsp">
		<p>
			<label for="userName">
				<div class="entry">Username</div> <input type="text" id="usern"
				name="userName" size="50">
			</label>
		</p>
		<p>
			<label for="pw">
				<div class="entry">Password</div> <input type="password" id="pw"
				name="password" size="50">
			</label>
		</p>
		<p align="center">
			<label><input type="submit" value="Login"></label> <label><input
				type="reset" value="Reset"></label>
		</p>
	</form>

</body>
</html>