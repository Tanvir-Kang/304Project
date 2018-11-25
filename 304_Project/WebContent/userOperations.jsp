<!-- TANVIR



TANVIR-->
<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<body>
<div id="header">
		<jsp:include page="adminHeader.jsp" />
	</div>
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
