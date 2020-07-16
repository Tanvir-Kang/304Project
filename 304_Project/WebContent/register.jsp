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
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<h2 align="center" style="font-family: Arial;" style="color:#0D2038">Register</h2>

	<div align="center">
		Required fields marked with <span style="color: red">*</span>
	</div>


	<form method="post" action="registerConfirm.jsp">
		<p>
			<label for="userName">
				<div class="entry">
					<%
						// Print prior error register message if present
						if (session.getAttribute("usernameTaken") != null){
							out.println("<p align='center' style='color:red;'>" + session.getAttribute("usernameTaken").toString()
									+ "</p>");
							session.removeAttribute("usernameTaken");
						}
					%>
					Username:<span style="color: red">* </span>
				</div> <input type="text" id="usern" name="userName" size="50" required>
			</label>
		</p>
		<p>
			<label for="pw">
				<div class="entry">
					Password (at least 6 characters):<span style="color: red">*</span>
				</div> <input type="password" id="pw" name="password" size="50" required
				title="Password must be 6 characters" pattern=".{6,}">
			</label>
		</p>

		<p>
			<label for="email">
				<div class="entry">
					<%
						// Print prior error register message if present
						if (session.getAttribute("emailTaken") != null){
							out.println("<p align='center' style='color:red;'>" + session.getAttribute("emailTaken").toString()
									+ "</p>");
							session.removeAttribute("emailTaken");
						}
					%>
					Email Address:<span style="color: red">*</span>
				</div> <input type="email" id="eml" name="email"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" size="50" required>
			</label>
		</p>
		<p>
			<label for="firstName">
				<div class="entry">
					First Name:<span style="color: red">*</span>
				</div> <input type="text" id="fname" name="firstName" size="50" required>
			</label>
		</p>
		<p>
			<label for="lastName">
				<div class="entry">
					Last Name:<span style="color: red">*</span>
				</div> <input type="text" id="lname" name="lastName" size="50" required>
			</label>
		</p>
		<p>
			<label for="phoneNum"> <%
 	// Print prior error register message if present
 	if (session.getAttribute("phoneTaken") != null){
 		out.println("<p align='center' style='color:red;'>" + session.getAttribute("phoneTaken").toString()
 				+ "</p>");
 		session.removeAttribute("phoneTaken");
 	}
 %>
				<div class="entry">Phone Number:</div> <input type="tel" id="pnum"
				name="phoneNum" size="50">
			</label>
		</p>
		<p>
			<label for="birthDate">
				<div class="entry">Birthdate:</div> <input type="date" id="bdate"
				name="birthDate" size="50">
			</label>
		</p>
		<p align="center">
			<label><input type="submit" value="Register"></label> <label><input
				type="reset" value="Reset"></label>
		</p>

	</form>



</body>
</html>