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
	//get isbn to modify some auction details
	String ISBN = request.getParameter("ISBN");
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

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
	//initialzing variables as global so they work with forms below not just in while loop
				int auctionID = 0;
				String title = null;
				String sellerUserName= null;
				String subject= null;
				String author= null;
				int edition= 0;
				int quality = 0;
				double startPrice = 0.0;
				String description = null;
	%>
	<%
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement bookStmt = null;
		ResultSet bookRst = null;
		
		bookStmt = con.prepareStatement("SELECT * FROM Book WHERE ISBN LIKE ?",bookRst.TYPE_SCROLL_SENSITIVE, bookRst.CONCUR_READ_ONLY);
		bookStmt.setString(1, ISBN);
		bookRst = bookStmt.executeQuery();
//if the rs is empty, let user know 
		if(bookRst.next()==false){out.println("<br><center><b>Error no books found with the selected ISBN</b>");}
		else{
//reset rs to before first row if not empty 
			bookRst.beforeFirst();
			while(bookRst.next()){
				
				 auctionID = bookRst.getInt("auctionID");
				 title = bookRst.getString("title");
				 sellerUserName = bookRst.getString("sellerUserName");
				 subject = bookRst.getString("subject");
				 author = bookRst.getString("author");
				 edition = bookRst.getInt("edition");
				 quality = bookRst.getInt("quality");
				 startPrice = bookRst.getDouble("startPrice");
				 description = bookRst.getString("description");
			}
		}
	}
	catch(SQLException ex){
		out.println(ex);
	}
	%>
	<!-- setting up forms to get updated book info and warning to new admins-->
	<b>Editable Fields:</b>
	<p>To edit a field simply click the field and add the updated information</p>
	<p>WARNING THESE FIELD DO NOT PERFORM VALIDATION AND YOU MAY CAUSE THE SERVER TO CRASH ENSURE THAT YOU A COMPETENT ADMIN BEFORE PROCEEDING</p> 
	
	<p>**Note you cannot modify primary key fields**</p> 
		<!-- get values from Java, and primary key fields are set to 'readonly' to ensure they are not modified-->
			<!--form posts to updateAuctionAdmin which is the 'action page' gets all values and updates the DB-->
	
	<form action="updateAuctionAdmin.jsp" method = "POST">
	Auction ID: <input type="text" name="inAuction" value=<%=auctionID %> readonly><br><br>
	ISBN: <input type="text" name="inISBN" value = <%= ISBN %> readonly><br><br>
	Seller: <input type="text" name="inSeller" value = <%= sellerUserName %> readonly ><br><br>
	Title: <input type="text" name="inTitle" value = <%= title%>><br><br>
	Subject: <input type="text" name="inSubject" value = <%= subject%>><br><br>
	Author: <input type="text" name="inAuthor" value = <%= author%>><br><br>
	Edition: <input type="text" name="inEdition" value = <%= edition%> ><br><br>
	Quality: <input type="text" name="inQuality" value = <%= quality%>><br><br>
	Start Price: <input type="text" name="inSP" value = <%= startPrice%>><br><br>
	Description: <input type="text" name="inDescription" value = <%= description%>><br><br>
	<input type="submit" value="Submit form">
	</form>

	</body>
	</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	