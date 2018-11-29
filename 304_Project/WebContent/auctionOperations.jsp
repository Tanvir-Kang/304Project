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
		<a class="active" href="adminOperations.jsp">Back</a> 
	<div id="inner" class="search-container">
			<form action="/304_Project/auctionOperations.jsp">
				<input type="text" placeholder="Search for a book"
					name="search">
				<button type="submit">Submit</button>
				<button type="submit">Reset Search</button>
			</form>
		</div>
	</nav>
	
	
	<%
	
	String userSearch = request.getParameter("search");
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
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement allAuctions = null;
		ResultSet resultAuctions = null;
		
		boolean hasSearch = userSearch!=null && !userSearch.equals("");
//convert the string to get all results similar to whats been typed
		String likeSearch = "%" + userSearch +"%";
		
//if the user does not search, list all 
		if(!hasSearch){
		allAuctions = con.prepareStatement("SELECT * FROM Book",resultAuctions.TYPE_SCROLL_SENSITIVE, resultAuctions.CONCUR_READ_ONLY);
		resultAuctions = allAuctions.executeQuery();
		}
//if the user does search for a book
		else if(hasSearch){
		allAuctions = con.prepareStatement("SELECT * FROM Book WHERE title LIKE ?",resultAuctions.TYPE_SCROLL_SENSITIVE, resultAuctions.CONCUR_READ_ONLY);
		allAuctions.setString(1, likeSearch);
		resultAuctions = allAuctions.executeQuery();

		}
//If there are no books found in result set let user know and then reset resultset
		if(resultAuctions.next()==false){out.println("<br><center><b>Error no books found</b>");}
		else{
			//reset RS
			resultAuctions.beforeFirst();
			out.println("<br><u>To edit an entry simply click the ISBN</u>");
			out.println("<br><center><b><u>All Books Listed</u></b>");
			out.println("<table cellpadding='5'>" + "<tr>"+"<th align='left'>ISBN</th>"  + "<th align='left'>Auction ID</th>"+ "<th align='left'>Title</th>" + "<th align='left'>Seller</th>"+"<th align='left'>Subject</th>");
			out.println("<th align='left'>Author</th>"+"<th align='left'>Edition</th>"+"<th align='left'>Quality</th>"+"<th align='left'>Start Price</th>"+"<th align='left'>Description</th>"+"</tr>");

			while(resultAuctions.next()){
//Getting all entries from rs
				String ISBN = resultAuctions.getString("ISBN");
				int auctionID = resultAuctions.getInt("auctionID");
				String title = resultAuctions.getString("title");
				String sellerUserName = resultAuctions.getString("sellerUserName");
				String subject = resultAuctions.getString("subject");
				String author = resultAuctions.getString("author");
				int edition = resultAuctions.getInt("edition");
				int quality = resultAuctions.getInt("quality");
				double startPrice = resultAuctions.getDouble("startPrice");
				String description = resultAuctions.getString("description");
//printing out all auction entries
				out.println("<tr><td>"+"<a href=editAuctionAdmin.jsp?ISBN="+ ISBN + ">" + ISBN + "</td>");
				out.println("<td>" + auctionID + "</td>");
				out.println("<td>" + title + "</td>");
				out.println("<td>" + sellerUserName + "</td>");
				out.println("<td>" + subject + "</td>");
				out.println("<td>" + author + "</td>");
				out.println("<td>" + edition + "</td>");	
				out.println("<td>" + quality + "</td>");
				out.println("<td>" + currFormat.format(startPrice) + "</td>");
				out.println("<td>" + description + "</td></tr>");
			}
			out.println("</table></center>");

			}
		}
	catch(SQLException ex){
		out.println(ex);
	}
	
	%>
	
	
	
</body>
</html>