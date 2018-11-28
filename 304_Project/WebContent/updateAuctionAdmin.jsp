<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Operations</title>
</head>
<body>
<div id="header">
		<jsp:include page="adminHeader.jsp" />
	</div>
	<div class="header">
		<h1>
			BookBids
		</h1>
		<p>View and Modify Auctions</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.jsp">Home</a> 
		<a class="active" href="auctionOperations.jsp">Back</a> 

	</nav>
	<%
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
	%>
	<%
	String ISBN2= null;	
	String title2 = null;;	
	String subject2=  null;
	String author2= null;
	String description2= null;

		ISBN2 = request.getParameter("inISBN");	
 		title2 = request.getParameter("inTitle");	
		subject2= request.getParameter("inSubject");
		author2= request.getParameter("inAuthor");
		description2 = request.getParameter("inDescription");
	
out.println("<p>" + ISBN2 + title2 + subject2 + author2 + description2 + "</p>");


	
	%>
	<%
	
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement updateStmt = null;
		ResultSet updateRst = null;
		
		updateStmt = con.prepareStatement("UPDATE Book SET title = ?, subject = ?, author = ?, description = ? WHERE auctionID LIKE ?");
		
		updateStmt.setString(1, title2);
		updateStmt.setString(2, subject2);
		updateStmt.setString(3, author2);
	
		updateStmt.setString(4, description2);
		updateStmt.setString(5, ISBN2);
		updateStmt.executeUpdate();
		
		}
	
	
	catch(SQLException ex){
		out.println(ex);
	}
	
	%>
	<!-- recieving data for updated book info-->	

		<p>Update Successful</p><br>
			<p>Press Back on header to return</p><br>
	
		</body>
	</html>
	
	
	
	
	