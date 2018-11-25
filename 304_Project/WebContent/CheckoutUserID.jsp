<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
button{
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 14px;
	background: #FFFACD;
	font-size: 17px;
	border: none;
	cursor: pointer;
}
</style>
<body>

	<div id="header">
		<jsp:include page="header.jsp" />
	</div>

<h2 align="center" style="font-size: 40px;">Check Out</h2>

<form method="get" action="auction.jsp">
<table align="center" >
<tr><td align="center" style="font-size: 25px;">  Customer ID:</td><td>
<tr><td>      </td></tr>
<tr><td align="center"><input type="text"  size="20"></td></tr>
<tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr>
<tr><td align="center" style="font-size: 25px;">  Password:</td><td>
<tr><td>      </td></tr>
<tr><td align="center"><input type="password" name="password" size="20"></td></tr>
<tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr>
<tr><td align="center" style="font-size: 25px;">  Address:</td><td>
<tr><td>      </td></tr>
<tr><td align="center"><input type="text" name="UserID" size="20"></td></tr>
<tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr><tr><td> </td></tr>
<tr><td align="center"><button type="submit">Submit</button></td></tr>
</table>
</form>

</body>
</html>