<!-- TANVIR



TANVIR-->
<%@ include file="adminAuth.jsp"%>
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
	String	quality = request.getParameter("inQuality");
	String	startPrice = request.getParameter("inSP");
	String	edition = request.getParameter("inEdition");
	String	auctionID =request.getParameter("inAuction");
	String	sellerUser = request.getParameter("inSeller");
	String	ISBN2 = request.getParameter("inISBN");	
	String	title2 = request.getParameter("inTitle");	
	String	subject2= request.getParameter("inSubject");
	String	author2= request.getParameter("inAuthor");
	String	description2 = request.getParameter("inDescription");
//recieve these values as string but need to be convered to int/double to correctly update SQL
	int edition2 = Integer.parseInt(edition);
	int auctionID2 = Integer.parseInt(auctionID);
	double startPrice2 = Double.parseDouble(startPrice);
	int quality2 = Integer.parseInt(quality);
	
	%>
	<%
	
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement updateStmt = null;
		ResultSet updateRst = null;
		
		updateStmt = con.prepareStatement("UPDATE Book SET title = ?, subject = ?, author = ?,edition = ?, quality = ?, startPrice = ?,  description = ? WHERE auctionID = ?");
		
		updateStmt.setString(1, title2);
		updateStmt.setString(2, subject2);
		updateStmt.setString(3, author2);
		updateStmt.setInt(4, edition2);
		updateStmt.setInt(5, quality2);
		updateStmt.setDouble(6, startPrice2);
		updateStmt.setString(7, description2);
		updateStmt.setInt(8, auctionID2);
		updateStmt.executeUpdate();
		
		}
	
	
	catch(SQLException ex){
		out.println(ex);
	}
	
	%>
	

		<p>Update Successful</p><br>
			<p>Press Back on header to return</p><br>
	
		</body>
	</html>
	
	
	
	
	