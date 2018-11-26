
<%@ page import="java.sql.*, data.loginDetails, java.io.*"%>
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
		}
		// Making connection
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();

		Connection con = DriverManager.getConnection(url, uid, pw);

		String SQL = "insert into Book values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, "1234");
		pstmt.setString(2, "1234");
		pstmt.setString(3, "1234");
		pstmt.setString(4, "1234");
		pstmt.setString(5, "1234");
		pstmt.setString(6, "1234");
		pstmt.setString(7, "1234");
		pstmt.setString(8, "1234");
		pstmt.setString(9, "1234");
		pstmt.setString(10, "1234");
		pstmt.setString(11, "1234");
		ResultSet rst = pstmt.executeQuery();
		while (rst.next()) {
			out.print(rst.getString("userName"));
		}

		con.close();
	%>
</body>
</html>