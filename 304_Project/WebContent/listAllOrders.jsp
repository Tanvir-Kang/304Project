<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Info</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0; }

/* Style the header */
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
	overflow: hidden; }

.nohover { }

.nohover:hover { background-color: #0D2038; }

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

nav a:hover { background-color: gray;}

nav a.active { background-color: #000000; }
.nav-right { float: right; }

#outer { width: 600px; }

#inner {width: 450px; margin: 0 auto;
}
td {padding-right: 30px}
</style>
</head>
<body>
<div class="header">
		<h1>
			BookBids
		</h1>
		<p>User Info</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.jsp">Home</a> 
		<a class="active" href="adminOperations.jsp">Back</a> 
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
NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try(Connection con = DriverManager.getConnection(url, uid, pw);){
	PreparedStatement allOrders = null;
	ResultSet resultallOrders = null;
	out.println("<br><center><b>All Orders</b>");
	
	double totalFeeCollected = 0;
	int totalNumAuctions = 0;
	 List<Double> fee = new ArrayList<>();
	 List<Integer> auctions = new ArrayList<>();
	 
	allOrders = con.prepareStatement("SELECT auctionID, highestBid, sellerUserName, buyerUserName, Auction.invioceID, auctionFee FROM Auction JOIN Company ON Auction.invioceID=Company.invioceID", resultallOrders.TYPE_SCROLL_INSENSITIVE,resultallOrders.CONCUR_READ_ONLY);
	resultallOrders = allOrders.executeQuery();
	if(resultallOrders.next()==false){out.println("<p> No orders to display</p>");}
	else{
		resultallOrders.beforeFirst();
		out.println("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>Auction ID</th>"  + "<th align='left'>Highest Bid</th>" + "<th align='left'>Seller</th>"+"<th align='left'>Buyer</th>"+"<th align='left'>Invoice ID</th>"+"<th align='left'>Auction Fee</th></tr>");

		while(resultallOrders.next()){
			int auctionID = resultallOrders.getInt("auctionID");
			double highestBid = resultallOrders.getDouble("highestBid");
			String sellerrUserName = resultallOrders.getString("sellerUserName");
			String buyerUserName = resultallOrders.getString("buyerUserName");
			int invioceID = resultallOrders.getInt("invioceID");
			double auctionFee = resultallOrders.getDouble("auctionFee");
			
			out.println("<tr><td>" + auctionID + "</td>");
			out.println("<td>" + highestBid + "</td>");
			out.println("<td>" + sellerrUserName + "</td>");
			out.println("<td>" + buyerUserName + "</td>");
			out.println("<td>" + invioceID + "</td>");
			out.println("<td>" + auctionFee + "</td></tr>");
	
			auctions.add(totalNumAuctions);
			fee.add(totalFeeCollected);
			totalNumAuctions +=1;
			totalFeeCollected +=auctionFee;
		}
		out.println("</table>");
		out.println("<p><b> Total revenue collected: " +currFormat.format(totalFeeCollected)  +"</b></p><br>");
		out.println("<p><b> Total Number of auctions: " + totalNumAuctions +"</b></p></center>");

	}
session.setAttribute("revenueList", fee);
session.setAttribute("auctionList",auctions);
}
catch(SQLException ex){
	out.println(ex);
}
%>
	</body>
	</html>