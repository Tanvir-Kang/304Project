<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.sql.*, data.loginDetails"%>
<!--Sam




	Sam --> 


<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
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
String sub = request.getParameter("sub"); 

	String subFeature = request.getParameter("subFeature");%>

	<%@ include file="auth.jsp"%>
	<!-- ^^^^ Copy and paste this line into the top of your jsp page to
Only allow access to logged in users. -->
	<%
		String user = (String) session.getAttribute("authenticatedUser");
	%>


<style>

<!-- help with the sideBar came from this tutorial: https://bootstrapious.com/p/bootstrap-sidebar -->
.tab{
border: 1px solid black;
text-align:center;


}

.main1{
		position: relative;
 	margin-top: 0px;
 	margin-left:0px;
 	margin-right:0;
 	width:200px;
 	height: 100%;
	background-color: white;
}
.main2{
	position: relative;
 	margin-top: 0;
 	margin-left:150px;
 	margin-right:200px;
 	width:70%;
 	height: 100%;
	background-color: white;
	
}
.bodyText{ margin:auto}
 .paddingtop50{ top:-200%;
 	font-family: 'Poppins', sans-serif;}
.sideBarButton {
	background-color: #faf2a1;
	font-family: 'Poppins', sans-serif;
	border: 3px solid #133054;
	display: inline-block;
    border: none;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
 
    }
.sideBarButton:hover{
	background-color: #133054;
    color: #fcf8d0;
}

.button1 {
	padding: 15px 32px;
	font-size: 15px;
	width: 125px;	
		
		}
.button2 {
   	font-size: 15px;
	width: 50px;
	border-radius: 12px;}

ul.books mn {
	
	margin-top: 5px;
    display: inline-block;
    vertical-align: top;
    *zoom: 1;
     background-color: white;
    line-height: 0%;
}
ul.books li {
	margin-top: 5px;
    width: 200px;
    display: inline-block;
    vertical-align: top;
    *display: block;
    *zoom: 1;
     background-color: white;
     border: 2px solid #133054;
    line-height: 0%;
}
ul.books de {

	margin-top: 10px;
    width: 1000px;
    height: 110px;
    padding: 10px;
    display: inline;
    vertical-align: top;
    *display: block;
    *zoom: 1;
    background-color: white; 
    line-height: 0%;
}
.thumbnail {
  position: relative;
  width: 200px;
  height: 200px;
  overflow: hidden;
}
thumbnail img {
  position: absolute;
 	max-width: 100%;
    max-height: 100%;
 
}

.thumbnail img.portrait {
  width: 100%;
  height: auto;
}
.h4 {
	font-weight: bold;
 	font-size: 40px;
}
.font{
	font-family: 'Poppins', sans-serif;
}
.fontMoney{ 
	 font-weight: bold;
	colour: #511730;
	font-family: 'Poppins', sans-serif;
}
.a{
	 border: 1px solid #133054;
	 box-shadow: 2px 2px #133054;
}

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
	left:0;
	right:0;
	top: 0;
	height:0;
	font-family: 'Rubik';
	font-size: 50px;
	background-color: white;
}

.main{
 	position: fixed;
 	margin-top: 0px;
 	margin-left:150px;
 
 	width:1000px;
 	height: 100%;
	background-color: white;
	overflow: auto;
	

}
#sideBar {
    height: 100%; /* Full-height: remove this if you want "auto" height */
    width: 160px; /* Set the width of the sidebar */
    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1; /* Stay on top */
    top: 0; /* Stay at the top */
   	left:0;
    background-color: #133054; /* Black */
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 20px;
}
#sideList {
	margin-top: -260px;
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

	<div id ="sideBar">


		<div id ="sideList">
						<form method="get" action="account.jsp">
							<input type="hidden" value="selling" name="feature" >
							<button type="submit" class="sideBarButton">My Auctions</button>
						</form>
						<form method="get" action="account.jsp">
							<input type="hidden" value="bids" name="feature" >
							<button type="submit" class="sideBarButton">Won Auctions</button>
						</form>
							<form method="get" action="account.jsp">
							<input type="hidden" value="watching" name="feature" >
							<button type="submit" class="sideBarButton">Watch List</button>
						</form>
							
							<form method="get" action="listAuctions.jsp">
							
							<button type="submit" class="sideBarButton">Search</button>
						</form>
		
								<form method="get" action="account.jsp">
							<input type="hidden" value="account" name="feature" >
							<button type="submit" class="sideBarButton">Account Settings</button>
						</form>
							<form method="get" action="userReview.jsp">
							
							<button type="submit" class="sideBarButton">Leave a Review</button>
						</form>
							<form method="get" action="homepage.jsp">
							<button type="submit" class="sideBarButton">Home</button>
						</form>
			</div>
		</div>

	
	<div class="main">
	
	
	
	
	<%	
	// Making connection
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	Connection con = DriverManager.getConnection(url, uid, pw);
	
	session = request.getSession(true);
		if (feature != null){
			if(feature.equals("selling") && subFeature == null){
					%><form method="get" action="account.jsp">
						<input type="hidden" value="selling" name="feature" >
						<input type="hidden" value="new" name="subFeature" >
						<button type="submit" class="sideBarButton">Post a Book for Sale</button>
					</form>
					
					<form method="get" action="account.jsp">
						<input type="hidden" value="selling" name="feature" >
						<input type="hidden" value="old" name="subFeature" >
						<button type="submit" class="sideBarButton">Active Auctions</button>
					</form>
					<%
			}if(subFeature!= null){
			if(subFeature.equals("new")){
				
			if (session.getAttribute("repostingBooks") != null)
				out.println("<p align='center' style='color:red;'>" + session.getAttribute("repostingBooks").toString() + "</p>");
		%><h1 style="margin-left: 20px;">Enter Book Details</h1>
			<form action="uploadServlet" method= "post" enctype = "multipart/form-data" style="margin-left: 20px;">
					<p><input type="hidden" name="user" value ="<%out.print(user);%>"></p>
					Book Title
					<p><input type="text" name="title" placeholder="Book Title" required></p>
					ISBN
					<p><input type="text" name="isbn" placeholder="ISBN: 978-3-16-148410-0" pattern="[0-9].{10}" required></p>
					Author 
					<p><input type="text" name="author" maxlength="100" required> </p>
					Edition 
					<p><input type="number" name="edition" placeholder="" max="50" min ="1" required></p>
					Quality(out of 5, where 5 is excellent and 0 is terrible)
					<p><input type="number" name="quality" placeholder="0-5 stars" max="5" min ="0" step="1" required></p>
					 Starting Price 
					<p><input type="number" name="startPrice" placeholder="" max="300" min ="0" step="1" required></p>
					Auction Length
					<p><input type="number" name="endDate" placeholder="One Week Limit" max="7" min ="1" step="1" size = "15" required></p>
					Brief description of the book and condition
					<p><input type="text" name="description" placeholder="150 character limit" maxlength="150" size ="150"></p>
					Subject
					  <p align="left">
					
					  <select size="1" name="subject" required>
						  	
						  <option value ="Anthropology">Anthropology</option>
						  <option>Applied Science Professional Platform</option>
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
		 			</select></p>
		 			Upload an Image of the Book
		 			
		 			<p><input type="file" name="pic" accept="image/*"></p>
		  			
		 			<p><input type="submit" value="Start Your Auction"></p>
 			</form> 	 
		<%	
			} else if (subFeature.equals("old")){
				
				String auctionId = request.getParameter("auctionId");
					
				
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
		}else if (feature.equals("bids")|| sub != null){
	
			
			String auctionId = request.getParameter("auctionId");

			
				try{
					
					
			
						String SQL = "SELECT Book.auctionId,title,edition,highestBid, author, ISBN, quality, endDate, subject,description, image, buyerUserName, Book.sellerUserName FROM Book, Auction WHERE Book.auctionID= Auction.auctionID AND buyerUserName = ? AND endDate < sysdatetime()";

								String value=user;
					
					
					
					PreparedStatement pstmt99 = con.prepareStatement(SQL);
			
					
					pstmt99.setString(1, user);
					
					ResultSet rst99 = pstmt99.executeQuery();
				
						
						List<String> Id = new ArrayList<>();
						List<String> title = new ArrayList<>();
						List<String> edition = new ArrayList<>();
						List<String> highestBid = new ArrayList<>();
						List<String> author = new ArrayList<>();
						List<String> ISBN = new ArrayList<>();
						List<String> quality = new ArrayList<>();
						List<String> endDate = new ArrayList<>();
						List<String> subject = new ArrayList<>();
						List<String> description = new ArrayList<>();
						List<String> image = new ArrayList<>();
						List<String> buyerUser = new ArrayList<>();
						List<String> sellerUser = new ArrayList<>();
					
						%><ul class="books de"><h1>Auctions You've Won</h1></ul><%
						while(rst99.next()){
		
							Id.add(rst99.getString("auctionID"));
							title.add(rst99.getString("title"));
							
							highestBid.add(rst99.getString("highestBid"));
							author.add(rst99.getString("author"));
							ISBN.add(rst99.getString("ISBN"));
						
						
							
							sellerUser.add(rst99.getString("sellerUserName"));
							image.add(rst99.getString("image"));	
						
						}
						
		
						
						
						
						
						%>	<ul class="books de"><%
					for (int i=0; i<Id.size();i++){
						String imgsrc;
						if(image.get(i) == null || image.get(i).isEmpty())
						imgsrc = "textbook.jpeg";
						else
						imgsrc = "displayImage.jsp?auctionid=" + Id.get(i);
							
						
							%>
						
							
							    	<table class="a">
							    		<tr>
								         	<th>
								         	<center>	<div class="thumbnail"><img src=<%=imgsrc %> width="200" height="200"></div></center>
								         	</th>
								       		<th><div class="main2">
								       			<table> 
								       				<tr> 
								       					<th><center>
								       						<table>
								       						<tr> <ul class="books">   
									       					 <mn><h1 class="font"><%out.println(title.get(i));%></h1></mn>
									       				
									       					
									       					</ul>
															<tr></tr><tr>
															  
															
															<ul class="books"> 
															<mn><p class="font">Author: <%out.println(author.get(i));%></p></mn>
															<mn><p class="font">ISBN: <%out.println(ISBN.get(i));%></p></mn>
								     						
								     						
								     					
								     						<mn><h2 class="fontMoney">Your Winning Bid: $<%out.println(highestBid.get(i));%></h2></mn>
								     					
								     						</tr>
								     						
								     				
								     							
								     							
								     		
								     						</ul></tr>
								     						</table></center>
								     					</th> 
								     				 </tr>
								     				 <tr>
								     				<th>
								     			
								     				 		
								         			</th>
								         			</tr><tr>	
								         				<th><center>
								         					<table> <tr><th> 
																		<form method="get" action="CheckoutUserID.jsp">
																		<input type="hidden" value="<%out.println(Id.get(i));%>" name="auctionID" >												
																		<input type="hidden" value="<%out.println(sellerUser.get(i));%>" name="seller" >
																		<input type="hidden" value="<%out.println(highestBid.get(i));%>" name="price" >
																			<input type="hidden" value="<%out.println(Id.get(i)); %>" name="auctionId" >
																		<button type="submit" class="sideBarButton button2">Settle the Auction</button></form>
															</table></center>
														</th>
													</tr>
										</table></div>
									</th>
								</tr>
							</table>
							   	
							   
					
							
						
							<%
							
								     						}
						%></ul></div><%
						}catch(Exception ex){
							out.println(ex);}
						
			
	
			 %>
				<script>
					setTimeout("account.jsp?feature=selling");
				</script>
				<%
		
		}else if ((feature.equals("watching")) || sub != null){
			
			
			String auctionId = request.getParameter("auctionId");
				

			
				try{
					
					
						String SQL2 = "SELECT auctionID, buyerUserName,bidAmount,dates from Bids WHERE auctionID=?";
						String SQL = " SELECT Book.auctionId,title,edition,highestBid, author, ISBN, quality, endDate, subject,description, image, Auction.buyerUserName FROM Book, savedAuctions, Auction WHERE Book.auctionID = savedAuctions.auctionID AND Auction.auctionID=savedAuctions.auctionID AND savedAuctions.buyerUserName = ?";
						String value=user;
					
					
					
					PreparedStatement pstmt9 = con.prepareStatement(SQL);
					PreparedStatement pstmt8 = con.prepareStatement(SQL2);
					
					pstmt9.setString(1, value);
					int aId=0;
					if (auctionId != null){
							aId = Integer.parseInt(auctionId.trim());
							
					}
					pstmt8.setInt(1,aId );
			
					ResultSet rst9 = pstmt9.executeQuery();
					ResultSet bidrst = pstmt8.executeQuery();
						
						List<String> Id = new ArrayList<>();
						List<String> title = new ArrayList<>();
						List<String> edition = new ArrayList<>();
						List<String> highestBid = new ArrayList<>();
						List<String> author = new ArrayList<>();
						List<String> ISBN = new ArrayList<>();
						List<String> quality = new ArrayList<>();
						List<String> endDate = new ArrayList<>();
						List<String> subject = new ArrayList<>();
						List<String> description = new ArrayList<>();
						List<String> image = new ArrayList<>();
						
						List<String> userBid = new ArrayList<>();
						List<String> buyerUser = new ArrayList<>();
						List<String> date = new ArrayList<>();
					
						%><ul class="books de"><h1>Your Watch List</h1></ul><%
						while(rst9.next()){
		
							Id.add(rst9.getString("auctionID"));
							title.add(rst9.getString("title"));
						
							edition.add(rst9.getString("edition"));
							highestBid.add(rst9.getString("highestBid"));
							author.add(rst9.getString("author"));
							ISBN.add(rst9.getString("ISBN"));
							quality.add(rst9.getString("quality"));
							endDate.add(rst9.getString("endDate"));
							subject.add(rst9.getString("subject"));
							description.add(rst9.getString("description"));
							image.add(rst9.getString("image"));	
						
						}
						
						while(bidrst.next()){
							
							buyerUser.add(bidrst.getString("buyerUserName"));
							userBid.add(bidrst.getString("bidAmount"));
							date.add(bidrst.getString("dates"));
						}
						
						
						
						
						%>	<ul class="books de"><%
					for (int i=0; i<Id.size();i++){
						String imgsrc;
						if(image.get(i) == null || image.get(i).isEmpty())
						imgsrc = "textbook.jpeg";
						else
						imgsrc = "displayImage.jsp?auctionid=" + Id.get(i);	
							
						
							%>
						
							
							    	<table class="a">
							    		<tr>
								         	<th>
								         	<center>	<div class="thumbnail"><img src=<%=imgsrc %> width="200" height="200"></div></center>
								         	</th>
								       		<th><div class="main2">
								       			<table> 
								       				<tr> 
								       					<th><center>
								       						<table>
								       						<tr> <ul class="books">   
									       					 <mn><h2 class="font"><%out.println(title.get(i));%></h2></mn>
									       					<mn><h2 class="font">ed. <%out.println(edition.get(i));%></h2></mn>
									       					<mn><h2 class="fontMoney">$<%out.println(highestBid.get(i));%></h2></mn>
									       					</ul>
															<tr></tr><tr>
															  
															<%if (sub==null){ %>	
															<ul class="books"> 
															<mn><p class="font">Author: <%out.println(author.get(i));%></p></mn>
															<mn><p class="font">ISBN: <%out.println(ISBN.get(i));%></p></mn>
								     						<mn><p class="font">Condition: <%out.println(quality.get(i));%>/5</p></mn>
								     						<mn><p class="font">Ends: <%out.println(endDate.get(i));%></p></mn>
								     						<%}else if (sub.equals("bidding")){%>
								     						
								     						<mn><center><tr><th><h2 class="font">User</h2></th></center>
								     							<center><th><h2 class="font">Bid</h2></th></center>
								     							<center><th><h2 class="font">Date</h2></th></center>
								     						</tr><%for(int j=0;j<date.size();j++){ %>
								     						<th><p class="font"><%out.println(buyerUser.get(i));%></p></th>
															<th><p class="font"><%out.println(userBid.get(i));%></p></th>
								     						<th><p class="font"><%out.println(date.get(i));%></p></th></mn>
								     					
								    							 <%} %>
								     							
								     							
								     					<%	}%>
								     					<%if (sub==null){%>	</ul><%} %>
								     						</ul></tr>
								     						</table></center>
								     					</th> 
								     				 </tr>
								     				 <tr>
								     				<th>
								     				<%if (sub==null){ %>	
								     				 		<center><article><p><%out.println(description.get(i));%></p></article></center>
								     				 		<%}%>	
								         			</th>
								         			</tr><tr>	
								         				<th><center>
								         					<table> <tr><th> 
																		<form method="get" action="account.jsp?&feature=selling&subFeature=old">
																		<input type="hidden" value="<%out.println(Id.get(i));%>" name="auctionID" >
																		
																		<input type="hidden" value="watching" name="feature" >
																		<input type="hidden" value="bidding" name="sub" >
																			<input type="hidden" value="<%out.println(Id.get(i)); %>" name="auctionId" >
																		<button type="submit" class="sideBarButton button2">See Bids</button></form>
																	</th><th>
																		<form method="get" action="bid.jsp">
																			<input type="hidden" value="<%out.println(highestBid.get(i)); %>" name="startingPrice" >
																		<input type="hidden" value="<%out.println(Id.get(i)); %>" name="auctionId" >
																		<button type="submit" class="sideBarButton button2">Bid</button></form>
																	</th><th>
																		<form method="get" action="delete.jsp">
																		<input type="hidden" value="<%out.println(Id.get(i));%>" name="auctionID" >
																		<button type="submit" class="sideBarButton button2">Remove</button></form>
																	</th></tr>
															</table></center>
														</th>
													</tr>
										</table></div>
									</th>
								</tr>
							</table>
							   	
							   
					
							
						
							<%
							
						}		
						%></ul></div><%
						}catch(Exception ex){
							out.println(ex);}
						
			
	
			 %>
				<script>
					setTimeout("account.jsp?feature=selling");
				</script>
				<%
		}else if (feature.equals("history")){
			out.print("<p1>history</p1>");
		}else if (feature.equals("account")){
			String SQL = "select firstName, lastName, email, phonenum, birthdate from webUser where userName = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user);
			ResultSet rst = pstmt.executeQuery();
			rst.next();
			String fname = rst.getString("firstName");
			String lname = rst.getString("lastName");
			String email = rst.getString("email");
			String pnum = rst.getString("phonenum");
			String bdate = rst.getString("birthdate");
			%>
			<h1 style="margin-left:20px">Your Account at a Glance</h1>
			<p style="margin-left:20px"><b>Username:</b></p><%out.print("<p style='margin-left:20px'>" + user + "</p>"); %>
			<p style="margin-left:20px"><b>First Name:</b></p><%out.print("<p style='margin-left:20px'>" + fname + "</p>"); %>
			<p style="margin-left:20px"><b>Last Name:</b></p><%out.print("<p style='margin-left:20px'>" + lname + "</p>"); %>
			<p style="margin-left:20px"><b>Email:</b></p><%out.print("<p style='margin-left:20px'>" + email + "</p>"); %>
			<p style="margin-left:20px"><b>Phone Number:</b></p><%
			if(pnum == null || pnum.isEmpty())
				out.print("<p style='margin-left:20px'>" + "No phone number on file." + "</p>");
			else
				out.print("<p style='margin-left:20px'>" + pnum + "</p>");
				
			%>
			<p style="margin-left:20px"><b>Birth Date:</b></p><%
			if(bdate.equals("1900-01-01"))
				out.print("<p style='margin-left:20px'>" + "No birthdate on file." + "</p>");
				else
			out.print("<p style='margin-left:20px'>" + bdate + "</p>"); %>
			<p></p>
			<p></p>
			
			
			
			<%
			rst.close();
			pstmt.close();
			
		} else 
			out.print("");
		}
		con.close();
	%>	
	</div>
</body>
