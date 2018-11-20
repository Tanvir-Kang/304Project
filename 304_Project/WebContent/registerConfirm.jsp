<!-- ZACH





ZACH -->

<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		// Get registration details
		String userN = request.getParameter("userName");
		String userPw = request.getParameter("password");
		String email = request.getParameter("email");
		String fName = request.getParameter("firstName");
		String lName = request.getParameter("lastName");
		String pNum = request.getParameter("phoneNum");
		String bDate = request.getParameter("birthDate");
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

		String SQL = "select userName, email, phonenum from webUser";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		ResultSet rst = pstmt.executeQuery();
		boolean checkuser = true;
		boolean checkemail = true;
		boolean checkphonenum = true;
		while (rst.next()) {
			if (rst.getString("userName").equals(userN) || userN.isEmpty())
				checkuser = false;
			if (rst.getString("email").equals(email))
				checkemail = false;
			if (rst.getString("phonenum").equals(pNum))
				checkphonenum = false;
		}
		if (checkuser == false) {
			out.println("<H1>Sorry! That username is already taken. Redirecting back to registration...</H1>");
	%>
	<script>
		setTimeout("document.location.href='register.jsp'", 4000);
	</script>
	<%
		}
		if (checkemail == false) {
			out.println("<H1>Sorry! That email is already in use. Redirecting back to registration...</H1>");
	%>
	<script>
		setTimeout("document.location.href='register.jsp'", 4000);
	</script>
	<%
		}
		if (checkphonenum == false) {
			out.println("<H1>Sorry! That phone number is already in use. Redirecting back to registration...</H1>");
	%>
	<script>
		setTimeout("document.location.href='register.jsp'", 4000);
	</script>
	<%
		}
		if (checkuser == true && checkemail == true && checkphonenum == true) {
			out.println("Registration Completed! You will be redirected to the login page shortly...");
			SQL = "insert into webUser values (?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userN);
			pstmt.setString(2, userPw);
			pstmt.setString(3, email);
			pstmt.setString(4, fName);
			pstmt.setString(5, lName);
			pstmt.setString(6, pNum);
			pstmt.setString(7, bDate);
			pstmt.executeUpdate();
			session.removeAttribute("loginMessage");

			con.close();
	%>
	<script>
		setTimeout("document.location.href='login.jsp'", 5000);
	</script>
	<%
		}
	%>
</body>
</html>