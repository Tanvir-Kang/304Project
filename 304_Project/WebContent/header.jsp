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
	padding: 40px;
	text-align: center;
	background: #999999;
	color: white;
}

.header h1 {
	font-size: 40px;
	font-weight: bolder;
}
.header img {
  width: 250px;
  height: 250px;

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
	float: left;
	font-family: sans-serif;
	font-size: 17px;
	color: white;
	padding-top: 11px;
	padding-right: 12px;
	padding-bottom: 11px;
	padding-left: 10px;
	text-decoration: none;
	display: block;
}

nav a:hover {
	background-color: gray;
}

nav a.active {
	background-color: #233852;
}

nav input[type=text] {
	padding: 6px;
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	margin-right: 16px;
	font-size: 17px;
	margin-bottom: 4px;
}

nav .search-container button {
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	background: #e7976f;
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
	text-align: center;
}
</style>
</head>
<body>
	<!-- HEADER  -->
	<div class="header">
		<img src="images/bookbids.png" alt="Logo">

	</div>

	<!-- /HEADER -->
	<nav>
		<%
			String uri = request.getRequestURI();
			String username = (String) session.getAttribute("authenticatedUser");
			if (username != null) {
		%>

		<a class="nohover">Hi, <%=username%>!
		</a>
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



		<div class="nav-right">
			<%
				boolean authenticated = false;
					if (session.getAttribute("admin") != null)
						authenticated = ((Boolean) session.getAttribute("admin")).booleanValue();
					if (authenticated == true) {
			%>
			<a style="background-color: #c40000; color: black"
				href="adminOperations.jsp">Admin Tools</a>
			<%
				}
			%>
			<a href="account.jsp">My Account</a> <a href="logout.jsp">Logout</a>

		</div>

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
	</nav>

</body>
</html>