<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.sql.*, data.loginDetails"%>
<!--Sam




	Sam --> 



<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
</head>
<%String feature = request.getParameter("feature"); 

	String subFeature = request.getParameter("subFeature");%>

	<%@ include file="auth.jsp"%>
	<!-- ^^^^ Copy and paste this line into the top of your jsp page to
Only allow access to logged in users. -->
	<%
		String user = (String) session.getAttribute("authenticatedUser");
	%>


<style>

<!-- help with the sideBar came from this tutorial: https://bootstrapious.com/p/bootstrap-sidebar -->

l {colour: black;
	font-family: 'font-family: 'Rubik', sans-serif;
	 sans-serif;}
	
#body {
	font-family: archivo;
	font-size: 1em;
	color: #333;
}
#topBar {
	position:absolute;
	left:0px;
	right:0;
	top: 0;
	height:100px;
	font-family: 'Rubik';
	font-size: 50px;
	background-color: white;
}

.main{
 	position: fixed;
 	margin-top: 90px;
 	margin-left:150px;
 	width:100%;
 	height: 100%;
background-color: #6FBEE7;

}
#sideBar {
    height: 100%; /* Full-height: remove this if you want "auto" height */
    width: 160px; /* Set the width of the sidebar */
    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1; /* Stay on top */
    top: 100px; /* Stay at the top */
   	left:0;
    background-color: #133054; /* Black */
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 20px;
}
#sideList {
	margin-top: -180px;
 	top: 50%;
 	margin-left: 100;
    width: 150px;
    position: fixed;
    z-index: 1; 
    background-color: #133054;
   
    padding-top: 20px;
}
.sideBarButton {
	border: 1px solid #133054;
	display: block;
	width: 158px;
	left-margin:-2px;
	font:Rubik;
    background-color: #133054;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    margin: 4px 2px;
    cursor: pointer;
    hover: #66b9e5;
}

li{
list-style-type: none;
}
li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}
.sideBarButton:hover{
background-color: #66b9e5;
    color: white;
}

#sideList a {
 	text-align: center; 
    padding: 0px;
   
    font: Rubik;
    font-size: 25px;
    color: white;
}
#smallLogo {
top-margin:50;
left-margin:-50;
}
#pageTitle { 
top-margin: -150px;}
#owlLogo {
left-margin:40px;
}
</style>
<body>
	<div id="topBar">
		<img src="owlLogo.jpeg" width="100px" height="100px" id="owlLogo">
		
		<div id="pageTitle">
			<b>BookBids</b>
		</div>
	
	</div>

	<div id ="sideBar">


		<div id ="sideList">
						<form method="get" action="account.jsp">
							<input type="hidden" value="selling" name="feature" >
							<button type="submit" class="sideBarButton">Selling</button>
						</form>
						<form method="get" action="account.jsp">
							<input type="hidden" value="bids" name="feature" >
							<button type="submit" class="sideBarButton">Bids</button>
						</form>
							<form method="get" action="account.jsp">
							<input type="hidden" value="watching" name="feature" >
							<button type="submit" class="sideBarButton">Watching</button>
						</form>
							
							<form method="get" action="account.jsp">
							<input type="hidden" value="history" name="feature" >
							<button type="submit" class="sideBarButton">History</button>
						</form>
						
			s				<form method="get" action="account.jsp">
							
							<button type="submit" class="sideBarButton">Account</button>
						</form>
							<form method="get" action="homepage.jsp">
							<button type="submit" class="sideBarButton">Home</button>
						</form>
			</div>
		</div>

	
	<div class="main">
	
	
	
	
	<%	session = request.getSession(true);
		if (feature != null){
			if(feature.equals("selling") && subFeature == null){
					%><form method="get" action="account.jsp">
						<input type="hidden" value="selling" name="feature" >
						<input type="hidden" value="new" name="subFeature" >
						<button type="submit" class="sideBarButton">Add a book for Auction</button>
					</form>
					
					<form method="get" action="account.jsp">
						<input type="hidden" value="selling" name="feature" >
						<input type="hidden" value="old" name="subFeature" >
						<button type="submit" class="sideBarButton">Your Books up for auction</button>
					</form>
					<%
			}if(subFeature!= null){
			if(subFeature.equals("new")){
				
			if (session.getAttribute("repostingBooks") != null)
				out.println("<p align='center' style='color:red;'>" + session.getAttribute("repostingBooks").toString() + "</p>");
		%><h1>Selling</h1>
			<form method= "get" action="postBookForAuction.jsp">
			Book Title <br>
			<input type="text" name="title" placeholder="Book Title" required> <br>
			ISBN <br>
			<input type="text" name="isbn" placeholder="ISBN: 978-3-16-148410-0" pattern="[0-9].{10}" required> <br>
			Author <br>
			<input type="text" name="author" placeholder="Author" maxlength="100" required> <br>
			edition <br>
			<input type="number" name="edition" placeholder="" max="50" min ="1" required> <br>
			  Quality(out of 5 stars, where 5 is excellent and 0 is terrible) <br>
			<input type="number" name="quality" placeholder="0-5 stars" max="5" min ="0" step="1" required> <br>
			 Starting Price <br>
			<input type="number" name="startPrice" placeholder="" max="300" min ="0" step="1" required> <br>
			 Length of Auction <br>
			<input type="number" name="endDate" placeholder="One Week Limit" max="7" min ="1" step="1" size = "15" required> <br>
			Description of the Book <br>
			<input type="text" name="description" placeholder="150 character limit" maxlength="150" size ="150"> <br>
			  <p align="left">
			
			  <select size="1" name="subject" required>
				  	
				  <option value ="Anthropology">Anthropology</option>
	s			  <option>Applied Science Professional Platform</option>
				  <option>Applied Science </option>
				  <option>Art History and Visual Culture</option>
				  <option>Astronomy</option>
				  <option>Biochemistry</option>       
				  <option>Biology</option>
				  <option>Creative and Critical Studies</option>
				  <option>Chemistry</option>
				  <option>Computer Science</option>
				  <option>Creative Writing</option>
				  <option>Cultural Studies</option>
				  <option>Curriculum Studies</option>
				  <option>Data Science</option>
				  <option>Digital Humanities</option>
				  <option>Educational Administration</option>
				  <option>Early Childhood Education</option>
				  <option>Economics</option> 
				  <option>Educational Studies</option>
				  <option>Earth and Environmental Sciences</option>
				  <option>English</option>
				  <option>Engineering</option>
				  <option>Educational Psychology and Special Education</option>
				  <option>Educational Technology</option>
				  <option>Film</option>
				  <option>French</option>
				  <option>Geography</option>
				  <option>German</option>
				  <option>Health Studies</option>
				  <option>Health-Interprofessional</option>
				  <option>History</option>
				  <option>Human Kinetics</option>
				  <option>Indigenous Studies</option>
				  <option>Japanese Studies </option>
				  <option>Language and Literacy Education</option>
				  <option>Mathematics</option>
				  <option>Media Studies</option>
				  <option>Management</option>
				  <option>Nursing</option>
				  <option>Philosophy</option>
				  <option>Physics</option>
				  <option>Political Science</option>
				  <option>Psychology</option>
				  <option>Sociology</option>
				  <option>Spanish</option>
				  <option>Statistics</option>
				  <option>Theatre</option>
				  <option>World Literature</option>
 			</select> <br>
 			Upload a Book Cover <br>
 			 <input type="file" name="pic" accept="image/*"> <br>
  			

 			<input type="submit" value="Start Your Auction">
 			</form> 	 
		<%	
			} else if (subFeature.equals("old")){
				
				String auctionId = request.getParameter("auctionId");
					
				// Making connection
					loginDetails ld = new loginDetails();
					String url = ld.getUrl();
					String uid = ld.getUid();
					String pw = ld.getPw();
					Connection con = DriverManager.getConnection(url, uid, pw);
				
					try{
						
						String SQL= null;
						String value=null;
						if (auctionId ==null){
							 SQL = "SELECT auctionId, sellerUserName,title,author,subject, sellerUserName FROM Book WHERE sellerUserName=?";
							 value=user;
						} else {
							
							 SQL = "SELECT auctionId,bidAmount,dates FROM Bids WHERE auctionID=?";
							value=auctionId;
						}
						
						PreparedStatement pstmt = con.prepareStatement(SQL);
						pstmt.setString(1, value);
						
						ResultSet rst = pstmt.executeQuery();
						
						if (auctionId ==null){
						out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th class=\"col-md-1\"></th><th>AuctionI Id</th> <th>Book title</th>");
						out.println("<th>Author</th><th>Subject</th></tr>");
							while(rst.next()){
								
								
								
								out.print("<td class=\"col-md-1\"><a href=\"account.jsp?auctionId=" + rst.getString(1) 
										+ "&feature=selling"
										+ "&subFeature=old" 
										+"\">Watch the Bidding</a></td>");

								String bookCategory = rst.getString(4);
								
					
								String colour = "green";

								out.println("<td><font color=\"" + colour + "\">" + rst.getString(1) + "</font></td>"
										+"<td><font color=\"" + colour + "\">" + rst.getString(3) + "</font></td>"
										+"<td><font color=\"" + colour + "\">" + rst.getString(4) + "</font></td>"
										+ "<td><font color=\"" + colour + "\">" + rst.getString(5) + "</font></td>"
										+ "</font></td></tr>");
								
							}
						} else {
							out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th>Bid</th> <th>Date</th></tr>");
							while(rst.next()){
								
								String colour = "green";

								out.println("<td><font color=\"" + colour + "\">" + rst.getString(2) + "</font></td>"
											+"<td><font color=\"" + colour + "\">" + rst.getString(3) + "</font></td>"
											+ "</font></td></tr>");
									
							}			
							}
					}catch(SQLException ex){
						out.println(ex);}
					
		
				 %>
					<script>
						setTimeout("account.jsp?feature=selling");
					</script>
					<%
						
					
			
					
					
				
				
			}
		}else if (feature.equals("bids")){
			out.print("<p1>Bids</p1>");
		
		}else if (feature.equals("watching")){
			
			
			String auctionId = request.getParameter("auctionId");
				
			// Making connection
				loginDetails ld = new loginDetails();
				String url = ld.getUrl();
				String uid = ld.getUid();
				String pw = ld.getPw();
				Connection con = DriverManager.getConnection(url, uid, pw);
			
				try{
					
					
				
						String SQL = "SELECT Book.auctionId,title,author,subject,startPrice, buyerUserName FROM Book, savedAuctions WHERE Book.auctionID = savedAuctions.auctionID AND buyerUserName =?";
						String value=user;
					
	
					
					PreparedStatement pstmt = con.prepareStatement(SQL);
					pstmt.setString(1, value);
					
					ResultSet rst = pstmt.executeQuery();
					
					if (auctionId ==null){
					out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th class=\"col-md-1\"></th><th>AuctionId</th> <th>Book title</th>");
					out.println("<th>Author</th><th>Subject</th><th>StartingPrice</th>/th></tr>");
						while(rst.next()){
							
							
							
							out.print("<td class=\"col-md-1\"><a href=\"account.jsp?auctionId=" + rst.getString(1) 
									+ "&feature=selling"
									+ "&subFeature=old" 
									+"\">Watch the Bidding</a></td>");

							String bookCategory = rst.getString(4);
							
				
							String colour = "green";

							out.println("<td><font color=\"" + colour + "\">" + rst.getString(1) + "</font></td>"
									+"<td><font color=\"" + colour + "\">" + rst.getString(2) + "</font></td>"
									+"<td><font color=\"" + colour + "\">" + rst.getString(3) + "</font></td>"
									+"<td><font color=\"" + colour + "\">" + rst.getString(4) + "</font></td>"
									+ "<td><font color=\"" + colour + "\">" + rst.getString(5) + "</font></td>"
									+ "</font></td></tr>");
							
						}
					} else {
						out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th>Bid</th> <th>Date</th></tr>");
						while(rst.next()){
							
							String colour = "green";

							out.println("<td><font color=\"" + colour + "\">" + rst.getString(2) + "</font></td>"
										+"<td><font color=\"" + colour + "\">" + rst.getString(3) + "</font></td>"
										+ "</font></td></tr>");
								
						}			
						}
				}catch(SQLException ex){
					out.println(ex);}
				
	
			 %>
				<script>
					setTimeout("account.jsp?feature=selling");
				</script>
				<%
		}else if (feature.equals("history")){
			out.print("<p1>history</p1>");
		}else if (feature.equals("account")){
			out.print("<p1>account</p1>");
		} else 
			out.print("");
		}
	%>	
	</div>
</body>
