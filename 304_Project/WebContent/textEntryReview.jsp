<!-- Tanvir -->

<%@ page import="java.sql.*, data.loginDetails"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.button {
	font: bold 11px Arial;
	text-decoration: none;
	background-color: #EEEEEE;
	color: #333333;
	padding: 2px 6px 2px 6px;
	border-top: 1px solid #CCCCCC;
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
}
</style>
</head>
<body>
<%@ page import="java.sql.*, data.loginDetails"%>
	<form action="writeReview.jsp" method="POST">
		(150 Character limit)<br>
		<textarea name="inComplaint" cols="40" rows="5"></textarea>
		<br> <br> <input type="submit" value="Submit form">
	</form>
	<form>
		<a href="userReview.jsp" class="button">Back to your auctions</a>

	</form>
		<%
		
		
	%>
</body>
</html>