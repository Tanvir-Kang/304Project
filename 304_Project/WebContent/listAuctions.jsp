<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
	
<%@ include file="jdbc.jsp" %>   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Books</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
.boxP {
  white-space: nowrap;
  overflow: hidden;
  max-width: 195px;
  text-overflow: ellipsis;
}
article{
	width: 40em;
	margin: 0;
	max-width: 100%;
	line-height: 1.5;
	font-size:15px;
}
.main1{
	position: relative;
 	margin-top: 0px;
 	margin-left:0px;
 	margin-right:0;
 	width:90%;
 	height: 100%;
	background-color: white;
	
}
.main2{
	position: relative;
 	margin-left:0px;
 	margin-right:20px;
 	width:85%;
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
    .sideBarButton2 {
	background-color: #6FBDE7 ;
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
	margin-top: 5px;
    width: 100%;
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

</style>

</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<center><h2>Search for the books</h2><center>
<center>
<form method="get" action="listAuctions.jsp" id="form2">
  <select size="1" name="subject" class="sideBarButton" required>   
  
  <option>All</option>
  
  
  <option>Anthropology</option>
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
  </select>
  </form>
 <button value="Submit" form="form2" class = "sideBarButton">Search by subject</button>
<p></p>
  <form method="get" action="listAuctions.jsp" id="form1">
  <input type="text" name="search" size="50" placeholder ="Search by..." class="sideBarButton">
  <select size="1" name="input" class="sideBarButton" required>
  <option>Title</option>
  <option>ISBN</option>
  <option>Author</option>
   </select>

</form>
  <button form="form1" value="submit" class = "sideBarButton">Submit</button></center>

<%
// Colors for different item categories
HashMap<String,String> colors = new HashMap<String,String>();	

colors.put("Anthropology", "#762020");
colors.put("Applied Science Professional Platform", "#983737");
colors.put("Applied Science", "#C34545");
colors.put("Art History and Visual Culture", "#D02A2A");
colors.put("Astronomy", "#C35030");
colors.put("Biochemistry", "#EE5D32");
colors.put("Biology", "#FF3800");
colors.put("Creative and Critical Studies", "#A85412");
colors.put("Chemistry", "#C65700");
colors.put("Computer Science", "#E47A26");
colors.put("Creative Writing", "#FF7100");
colors.put("Cultural Studies", "#FFD800");
colors.put("Curriculum Studies", "#B39C1F");
colors.put("Data Science", "#699411");
colors.put("Digital Humanities", "#80DF00");
colors.put("Educational Administration", "#9EEB00");
colors.put("Early Childhood Education", "#2F8414");
colors.put("Economics", "#4BAD2B");
colors.put("Educational Studies", "#64EF36");
colors.put("Earth & Environmental Sciences", "#057225");
colors.put("English", "#346C44");
colors.put("Engineering", "#25B64E");
colors.put("Educational Psychology and Special Education", "#277C5A");
colors.put("Educational Technology", "#20BE7F");
colors.put("Film", "#0DC3CA");
colors.put("French", "#0C87CD");
colors.put("Geography", "#1E54AA");
colors.put("German", "#1662DA");
colors.put("Health Studies", "#3C3ED5");
colors.put("Health-Interprofessional", "#0004FF");
colors.put("History", "#5D3BDD");
colors.put("Human Kinetics", "#571A90");
colors.put("Indigenous Studies", "#7F5BA0");
colors.put("Japanese Studies", "#7A2EC0");
colors.put("Language and Literacy Education", "#89309B");
colors.put("Mathematics", "#8D1A89");
colors.put("Media Studies", "#A852A5");
colors.put("Management", "#E627DF");
colors.put("Nursing", "#F269D5");
colors.put("Philosophy", "#7B0E40");
colors.put("Physics", "#993965");
colors.put("Political Science", "#E43987");
colors.put("Psychology", "#FF0074");
colors.put("Sociology", "#770B22");
colors.put("Spanish", "#B5435B");
colors.put("Statistics", "#B54343");
colors.put("Theatre", "#CA313D");
colors.put("World Literature", "#020000");
%>

<%
try { // Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
	
	
    response.sendRedirect("login.jsp");
}
	// Get product name to search for
String filter = "", sql = "";
String search = request.getParameter("search");
String input = request.getParameter("input");
String category = request.getParameter("subject");

boolean hasNameParam = input != null && !input.equals("");
boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");

if (hasNameParam)
{

	if (input.equals("Title")){
		search = '%'+search+'%';
		sql = "SELECT title,edition,highestBid, author, ISBN, quality, endDate, subject, book.auctionID, description, image FROM Book, Auction WHERE book.auctionID = Auction.auctionID AND endDate > sysdatetime() AND title LIKE ?";
	}else if (input.equals("ISBN")){
		search = '%'+search+'%';
		sql = "SELECT title,edition,highestBid, author, ISBN, quality, endDate, subject, book.auctionID, description, image FROM Book, Auction WHERE book.auctionID = Auction.auctionID AND endDate > sysdatetime() AND ISBN LIKE ?";
	}else if (input.equals("Author")){
		search = '%'+search+'%';
		sql = "SELECT title,edition,highestBid, author, ISBN, quality, endDate, subject, book.auctionID, description, image FROM Book, Auction WHERE book.auctionID = Auction.auctionID AND endDate > sysdatetime() AND author LIKE ?";
	}
}
else if (hasCategoryParam)
{
	search = category;
	filter = "<h3>Books in subject: '"+search+"'</h3>";
	sql = "SELECT title,edition,highestBid, author, ISBN, quality, endDate, subject,book.auctionID, description, image FROM Book, Auction WHERE book.auctionID = Auction.auctionID  AND endDate > sysdatetime() AND subject = ?";
	
}
else
{
	filter = "<h3>All Products</h3>";
	sql = "SELECT ?, title,edition,highestBid, author, ISBN, quality, endDate, subject,book.auctionID, description, image FROM Book, Auction WHERE book.auctionID = Auction.auctionID AND endDate > sysdatetime()";
	
}


NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{
	
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	Connection con = DriverManager.getConnection(url, uid, pw);
	
	PreparedStatement pstmt = con.prepareStatement(sql);
if (search !=null){
	pstmt.setString(1, search);	
} else {
	pstmt.setString(1, "*");	
}

	int i=0;
	List<String> auctionId = new ArrayList<>();
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

	ResultSet rst = pstmt.executeQuery();
	
	while (rst.next()){
		
		auctionId.add(rst.getString("auctionID"));
		title.add(rst.getString("title"));
		edition.add(rst.getString("edition"));
		highestBid.add(rst.getString("highestBid"));
		author.add(rst.getString("author"));
		ISBN.add(rst.getString("ISBN"));
		quality.add(rst.getString("quality"));
		endDate.add(rst.getString("endDate"));
		subject.add(rst.getString("subject"));
		description.add(rst.getString("description"));
		image.add(rst.getString("image"));	
	}
	
	%>	
<div class ="main1">
<center><table>
<tr> <th> 
<form method="get" action="listAuctions.jsp">
	<input type="hidden" value="grid" name="feature" >
	<% if (request.getParameter("subject") != null) out.print("<input type=\"hidden\" value=\"" + request.getParameter("subject") + "\" name=\"subject\">");%>
	<% if (request.getParameter("input") != null) {out.print("<input type=\"hidden\" value=\"" + request.getParameter("input") + "\" name=\"input\">");}%>
	<% if (request.getParameter("search") != null) {out.print("<input type=\"hidden\" value=\"" + request.getParameter("search") + "\" name=\"search\">");}%>
	<button type="submit" class="sideBarButton2">Grid</button>
</form>
</th><th>
<form method="get" action="listAuctions.jsp">
	<input type="hidden" value="detailed" name="feature" >
	<% if (request.getParameter("subject") != null) out.print("<input type=\"hidden\" value=\"" + request.getParameter("subject") + "\" name=\"subject\">");%>
	<% if (request.getParameter("input") != null) {out.print("<input type=\"hidden\" value=\"" + request.getParameter("input") + "\" name=\"input\">");}%>
	<% if (request.getParameter("search") != null) {out.print("<input type=\"hidden\" value=\"" + request.getParameter("search") + "\" name=\"search\">");}%>
	<button type="submit" class="sideBarButton2">Detailed</button>
</form>
</th></tr>
</table></center>

<center>
<ul class="books">
<% 
boolean isGrid=true;
if ("detailed".equals(request.getParameter("feature")))
	isGrid=false;
if (isGrid==true){
for (i=0; i<auctionId.size();i++) {
	String imgsrc;
	if(image.get(i) == null || image.get(i).isEmpty())
	imgsrc = "textbook.jpeg";
	else
	imgsrc = "displayImage.jsp?auctionid=" + auctionId.get(i);
%>
    <li>
	          <center><div class="thumbnail"><img src= <%=imgsrc %> width="200" height="200"></div></center>
	          <div class="boxP"><center><h4 class="font"><%out.println(title.get(i));%></h4></center></div>
	          <center><p class="font">$<%out.println(highestBid.get(i));%></p></center>
	          <center><table>
<tr> <th> 
<form method="get" action="bid.jsp">
	<input type="hidden" value="<%out.println(auctionId.get(i));%>" name="auctionId" >
	<input type="hidden" value="<%out.println(highestBid.get(i));%>" name="startingPrice" >
	<button type="submit" class="sideBarButton button2">Bid</button>
</form>
</th><th>
<form method="get" action="saveAuction.jsp">
	<input type="hidden" value="<%out.println(auctionId.get(i));%>" name="auctionId" >
	<button type="submit" class="sideBarButton button2">Save</button>
</form>
</th></tr>
</table></center>
  </li>
  <%} %></ul>
 <ul>
  <%}else if (isGrid!=true){ // loop ends here for s
	  for (i=0; i<auctionId.size(); i++) {%>
	<de>
    	<table class="a">
    		<tr>
	         	<th>
	         		<div class="thumbnail"><img src="textbook.jpeg"></div>
	         	</th>
	       		<th><div class="main2">
	       			<table> 
	       				<tr> 
	       					<th><center>
	       						<table>
	       						<tr> <ul class="books">   
		       					 <mn><h2 class="font"><%out.println(title.get(i));%></h2></mn>
		       					<mn><h2 class="font">Ed: <%out.println(edition.get(i));%></h2></mn>
		       					<mn><h2 class="fontMoney">$<%out.println(highestBid.get(i));%></h2></mn>
		       					</ul>
								<tr></tr><tr>
								<ul class="books">   
									
								<mn><p class="font">Author: <%out.println(author.get(i));%></p></mn>
								<mn><p class="font">ISBN: <%out.println(ISBN.get(i));%></p></mn>
	     						<mn><p class="font">Condition: <%out.println(quality.get(i));%>/5</p></mn>
	     						<mn><p class="font">Ends: <%out.println(endDate.get(i));%></p></mn>
	     						</ul></tr>
	     						</table></center>
	     					</th> 
	     				 </tr>
	     				 <tr>
	     				<th>
	     				 		<center><article><p><%out.println(description.get(i));%></p></article></center>
	         		
	         			<tr>	
	         				<th><center>
	         					<table> <tr><th> 
								<form method="get" action="bid.jsp">
											<input type="hidden" value="<%out.println(auctionId.get(i));%>" name="auctionId" >
											<input type="hidden" value="<%out.println(highestBid.get(i));%>" name="startingPrice" >
											<button type="submit" class="sideBarButton button2">Bid</button>
										</form>
										</th><th>
										<form method="get" action="saveAuction.jsp">
											<input type="hidden" value="<%out.println(auctionId.get(i));%>" name="auctionId" >
											<button type="submit" class="sideBarButton button2">Save</button>
										</form>
								</table></center>
							</th>
						</tr>
			</table></div>
		</th>
	</tr>
</table>
   	</de>
   <%}} %>
</ul></div>
	</center>	
	<%
	
	closeConnection();
} catch (SQLException ex) {
	out.println(ex);
}

%>
</body>
</html>