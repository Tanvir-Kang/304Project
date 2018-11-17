<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing Page</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=<DATABASE_NAME>;";
String uid = "zmaludzi";
String pw = "32950164";
Connection con = DriverManager.getConnection(url, uid, pw);

String SQL = "select userName from User";
PreparedStatement pstmt = con.prepareStatement(SQL);
ResultSet rst = pstmt.executeQuery();
while(rst.next()){
	out.print(rst.getString("userName"));
}

%>
</body>
</html>