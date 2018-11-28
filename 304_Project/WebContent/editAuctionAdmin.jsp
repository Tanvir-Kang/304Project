<!-- TANVIR



TANVIR-->
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
	//All result set values
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
		if(bookRst.next()==false){out.println("<br><center><b>Error no books found with the selected ISBN</b>");}
		else{
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
	<!-- setting up forms to get updated book info-->
	<b>Editable Fields:</b>
	
	<p>To edit a field simply click the field and add the updated information</p><br>
	<p>WARNING THESE FIELD DO NOT PERFORM VALIDATION AND YOU MAY CAUSE THE SERVER TO CRASH</p> 
	<p>ENSURE THAT YOU A COMPETENT ADMIN BEFORE PROCEEDING</p> 
	
	<form action="updateAuctionAdmin.jsp" method = "POST">
	<input type="hidden" id="auction" name="inAuction" value=<%=auctionID %>>
	ISBN: <input  disabled type="text" name="inISBN" value = <%= ISBN %> readonly="readonly"><br><br>
	Title: <input disabled  type="text" name="inTitle" value = <%= title%>><br><br>
	Subject: <input disabled  type="text" name="inSubject" value = <%= subject%>><br><br>
	Author: <input  disabled type="text" name="inAuthor" value = <%= author%>><br><br>
	Edition: <input disabled type="text" name="inEdition" value = <%= edition%> ><br><br>
	Quality: <input disabled type="text" name="inQuality" value = <%= quality%>><br><br>
	Start Price: <input disabled type="text" name="inSP" value = <%= startPrice%>><br><br>
	Description: <input type="text" name="inDescription" value = <%= description%>><br><br>
	<input type="submit" value="Submit form">
	</form>

	</body>
	</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	