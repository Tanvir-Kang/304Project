<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	text-align: center;s
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

<h2 align="center" style="font-family: Arial;">Check Out</h2>

<form method="get" action="auction.jsp">
<table>
<tr><td>Customer ID:</td><td><input type="text" name="UserID" size="20"></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" size="20"></td></tr>
<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</table>
</form>

</body>
</html>