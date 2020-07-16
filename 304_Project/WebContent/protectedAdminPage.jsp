<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Example of only admin accessible page</title>
</head>
<body>
<!-- Copy and paste this line into the top of your jsp page to
Only allow access to logged in users. -->
	<%@ include file="adminAuth.jsp"%>
	<!-- ^^^^ Copy and paste this line into the top of your jsp page to
Only allow access to logged in users. -->
	<%
		String user = (String) session.getAttribute("authenticatedUser");
		out.println("<h1>You have access to this page: " + user + "</h1>");
	%>
</body>
</html>