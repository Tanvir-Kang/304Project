<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Operations</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}

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
	margin-right: 0px;
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
td {padding-right: 30px}
</style>
</head>
<body>
<div class="header">
		<h1>
			BookBids
		</h1>
		<p>User Operations</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.jsp">Home</a> 
		<a class="active" href="adminOperations.jsp">Back</a> 

	<div id="inner" class="search-container">
			<form action="/304_Project/userOperations.jsp">
				<input type="text" placeholder="Search for a User"
					name="search">
				<button type="submit">Submit</button>
				<button type="submit">Reset Search</button>
			</form>
		</div>
		<div class="topnav-right">
			<a href="#search">Search</a> <a href="#about">About</a>
		</div>
	</nav>
	
	<%
	String userSearch = request.getParameter("search");
	// Making connection
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
	%><% 
	StringBuilder userDisplay = new StringBuilder();
	//setting up preparedstatement and result set for usersearch
	
	
			
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
	PreparedStatement userStatement = null;
	ResultSet userResult = null;	
	boolean hasSearch = userSearch!=null && !userSearch.equals("");
	
		if(!hasSearch){
			userStatement = con.prepareStatement( "SELECT userName,firstName,lastName,email,phonenum,birthdate FROM webUser");
			userResult = userStatement.executeQuery();
		}
		else if (hasSearch){
			//modifying user query so it gets all similar results
			String likeUserSearch = "%" + userSearch + "%";
			userStatement = con.prepareStatement("SELECT userName,firstName,lastName,email,phonenum,birthdate FROM webUser WHERE userName LIKE ?");
			userStatement.setString(1, likeUserSearch);
			userResult = userStatement.executeQuery();

		}
	
		userDisplay.append("<br><center><b>All User Information</b>");
	
		userDisplay.append("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>User Name</th>"  + "<th align='left'>First Name</th>" + "<th align='left'>Last Name</th>"+"<th align='left'>Email</th>"+"<th align='left'>Phone Number</th>"+"<th align='left'>Birthdate</th>"+"</tr>");

		
		while(userResult.next()){
			String userName = userResult.getString("userName");
			String firstName = userResult.getString("firstName");
			String lastName = userResult.getString("lastName");
			String email = userResult.getString("email");
			String phonenum = userResult.getString("phonenum");
			java.sql.Date BDate = userResult.getDate("birthdate");
				
				userDisplay.append("<tr><td>"+"<a href=userInfo.jsp?userName=" + userName + ">"+userName+"</td>" );
				userDisplay.append("<td>" + firstName + "</td>" );
				userDisplay.append("<td>" + lastName + "</td>" );
				userDisplay.append("<td>" + email + "</td>" );
				userDisplay.append("<td>" + phonenum + "</td>" );
				userDisplay.append("<td>" + BDate + "</td></tr>" );
			
			
		}
		userDisplay.append("</table></center>");
		out.println(userDisplay);
		
	}
	catch(SQLException ex){
		out.println(ex);
	}
	
	%>
</body>
</html>
