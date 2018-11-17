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

try { 
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
	out.println("ClassNotFoundException: " + e);
// Making connection


		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();



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