<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Info</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}

/* Style the header */
.header {
	padding: 80px;
	text-align: center;
	background: #FF0000;
	color: white;
}

.header h1 {
	font-size: 40px;
	font-weight: bolder;
}

nav {
	width: 100%;
	height: 40px;
	background-color: #000000;
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
	background-color: #000000;
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
td {padding-right: 30px}
</style>
</head>
<body>
<div class="header">
		<h1>
			BookBids
		</h1>
		<p>User Info</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.jsp">Home</a> 
		<a class="active" href="userOperations.jsp">Back</a> 
	</nav>
<%
String input = request.getParameter("userName");
out.println("<p>Infomation about: " + input + "</p>");
//Making connection
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} 
	catch (java.lang.ClassNotFoundException e) {
		out.println("ClassNotFoundException: " + e);
		}
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement userAddress = null;
		ResultSet resultAddress = null;
		/*
		userName  VARCHAR(30),
	postalZipcode     VARCHAR(10),
	street    VARCHAR(50),
	city  VARCHAR(30),
	provinceState    VARCHAR(50),
	country   VARCHAR(50),*/
		String uName = "%" + input + "%";
		userAddress = con.prepareStatement("SELECT postalZipcode, street, city, provinceState, country FROM ShippingAddress WHERE userName = ' HelenfromHell'");
	//	userAddress.setString(1, uName);
		resultAddress = userAddress.executeQuery();
		out.println("<br><center><b>Address Information</b>");
		out.println("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>Postal Code</th>"  + "<th align='left'>Street</th>" + "<th align='left'>City</th>"+"<th align='left'>Province</th>"+"<th align='left'>County</th></tr>");
		
		while(resultAddress.next()){
			String postal = resultAddress.getString("postalZipcode");
			String street = resultAddress.getString("street");
			String city = resultAddress.getString("city");
			String province = resultAddress.getString("provinceState");
			String country = resultAddress.getString("country");
				
				out.println("<tr><td>" + postal + "</td>");
				out.println("<td>" + street + "</td>");
				out.println("<td>" + city + "</td>");
				out.println("<td>" + province + "</td>");
				out.println("<td>" + country + "</td>");


			
		}
		out.println("</table>");
	}
	catch(SQLException ex){
		out.println(ex);
	}

%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</body>
</html>