<!-- ZACH




ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}

/* Style the header */
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

nav {
	width: 100%;
	height: 40px;
	background-color: #0D2038;
	overflow: hidden;
}

.nohover {
	
}

.nohover:hover {
	background-color: #0D2038;
}

nav a {
	display: flex;
	float: left;
	font-family: sans-serif;
	font-size: 17px;
	color: white;
	padding-top: 11px;
	padding-right: 12px;
	padding-bottom: 11px;
	padding-left: 10px;
	text-decoration: none;
}

nav a:hover {
	background-color: gray;
}

nav a.active {
	background-color: #133054;
}

nav input[type=text] {
	float: center;
	padding: 6px;
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	margin-right: 16px;
	font-size: 17px;
	margin-bottom: 4px;
}

nav .search-container button {
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 14px;
	background: #e1612f;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

nav .search-container button:hover {
	background: #ccc;
}

.nav-right {
	float: right;
}

#outer {
	width: 600px;
}

#inner {
	width: 450px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<div class="header">
		<h1>BookBids</h1>
		<p>Watch the bids start rolling in.</p>
	</div>

	<nav>
		<%
			String uri = request.getRequestURI();
			String username = (String) session.getAttribute("authenticatedUser");
			if (username != null) {
		%>
		<a class="nohover">Hi, <%=username%>!</a>
		<%
			}
		%>
		<a href="homepage.jsp"
			<%if (uri.equals("/304_Project/homepage.jsp")) {%> class="active"
			<%}%>>Home</a> <a href="listAuctions.jsp"
			<%if (uri.equals("/304_Project/listAuctions.jsp")) {%> class="active"
			<%}%>>Auctions</a>
		<%
			if (username == null) {
		%>
		<a href="login.jsp" <%if (uri.equals("/304_Project/login.jsp")) {%>
			class="active" <%}%>>Login</a> <a href="register.jsp"
			<%if (uri.equals("/304_Project/register.jsp")) {%> class="active"
			<%}%>>Register</a>
		<%
			} else {
		%>
		<a href="logout.jsp">Logout</a>
		<%
			}
		%>
		<div id="inner" class="search-container">
			<form action="/304_Project/listAuctions.jsp">
				<input type="text" placeholder="Author, Title, ISBN..."
					name="search">
				<button type="submit">Submit</button>
			</form>
		</div>
		<div class="topnav-right">
			<a href="#search">Search</a> <a href="#about">About</a>
		</div>
	</nav>
	<!-- /HEADER -->
</body>
</html>