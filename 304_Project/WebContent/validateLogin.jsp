<!-- ZACH








ZACH -->
<%@ page language="java"
	import="java.io.*, data.loginDetails, java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging in...</title>
</head>
<body>
	<%
		String authenticatedUser = null;
		session = request.getSession(true);// May create new session
		try {
			authenticatedUser = validateLogin(out, request, session);
		} catch (IOException e) {
			out.println(e);
		}
		if (authenticatedUser != null)
			response.sendRedirect("homepage.jsp"); // Success
		else
			response.sendRedirect("login.jsp"); // Failed login
		// Redirect back to login page with a message
	%>
	<%!String validateLogin(JspWriter out, HttpServletRequest request, HttpSession session)
			throws IOException, SQLException {
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String retStr = null;
		if (username == null || password == null) {
			session.setAttribute("loginMessage", "Username and password must not be empty.");
			return null;
		}
		if ((username.length() == 0) || (password.length() == 0)) {
			session.setAttribute("loginMessage", "Username and password must not be empty.");
			return null;
		}

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
		//Query username and password
		String SQL = "select userName, password from webUser where userName = ?";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, username);
		ResultSet rst = pstmt.executeQuery();
		// Check if correct
		if (!rst.next()) {
			session.setAttribute("loginMessage", "Username does not exist.");
		}

		else if (username.equals(rst.getString("userName")) && password.equals(rst.getString("password")))
			retStr = username;
		if (retStr != null) {
			session.removeAttribute("loginMessage");
			session.removeAttribute("loginMessage");
			session.removeAttribute("phoneTaken");
			session.removeAttribute("emailTaken");
			session.removeAttribute("usernameTaken");
			session.setAttribute("authenticatedUser", username);
			//Query whether use is admin
			SQL = "select admin from webUser where username = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, username);
			rst = pstmt.executeQuery();
			// Check if user is admin
			rst.next();
			if (rst.getInt("admin") == 1)
				session.setAttribute("admin", true);
		} else if (retStr == null)
			session.setAttribute("loginMessage", "Incorrect username or password.");
		con.close();
		return retStr;

	}%>
</body>
</html>