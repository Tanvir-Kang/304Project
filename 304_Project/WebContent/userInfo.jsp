<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
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
		<a class="active" href="userOperations.jsp">Back</a> 
	
		
	</nav>
<%
String input = request.getParameter("userName");

String uName = "%" + input + "%" ;
out.println("<p>Infomation about: " + input + "</p>");
out.println("<p>Click here to delete this user (No undo!): " + "<a href=deleteUser.jsp?userName=" + input +">"+ input + "</a></p>");

//userDisplay.append("<tr><td>"+"<a href=userInfo.jsp?userName=" + userName + ">"+userName+"</td>" );


//Making connection
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
	

	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		PreparedStatement userAddress = null;
		ResultSet resultAddress = null;

//THIS IS FOR ADDRESS INFORMATION!
	
		userAddress = con.prepareStatement("SELECT postalZipcode, street, city, provinceState, country FROM ShippingAddress WHERE userName LIKE ?",resultAddress.TYPE_SCROLL_SENSITIVE,resultAddress.CONCUR_READ_ONLY);
		userAddress.setString(1, uName);
		resultAddress = userAddress.executeQuery();
		out.println("<br><center><b>Address Information</b>");
		if(resultAddress.next()==false){out.println("<p> No user address information</p>");}
		
		else{
			resultAddress.beforeFirst();
			out.println("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>Postal Code</th>"  + "<th align='left'>Street</th>" + "<th align='left'>City</th>"+"<th align='left'>Province</th>"+"<th align='left'>County</th></tr>");

			while(resultAddress.next()){
		
		
			String postal = resultAddress.getString("postalZipcode");
			String street = resultAddress.getString("street");
			String city = resultAddress.getString("city");
			String province = resultAddress.getString("provinceState");
			String country = resultAddress.getString("country");
				
				out.println("<tr><td>" + postal + "</td>");
				out.println("<td>" + street + "</td>");
				out.println("<td>" + city + "</td>");
				out.println("<td>" + province + "</td>");
				out.println("<td>" + country + "</td></tr>");
			}
		out.println("</table></center>");
		}
//THIS IS FOR COMPLAINTS AGAINTS USER
		PreparedStatement userComplaint = null;
		ResultSet resultComplaint = null;
			userComplaint = con.prepareStatement("SELECT complaintID , auctionID, buyerUserName, description, dateSubmitted  FROM Complaint WHERE sellerUserName LIKE ?", resultComplaint.TYPE_SCROLL_SENSITIVE,resultComplaint.CONCUR_READ_ONLY);
			userComplaint.setString(1, uName);
			resultComplaint = userComplaint.executeQuery();
			
			
			out.println("<br><center><b>Complaints againts user</b>");
			if (resultAddress.next() == false) { out.println("<p>No complaints againts: " + input + "</>"); }
			else{
				out.println("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>ComplaintID</th>"  + "<th align='left'>Auction ID</th>" + "<th align='left'>Complaint by: </th>"+"<th align='left'>Description</th>"+"<th align='left'>Date</th></tr>");
				resultComplaint.beforeFirst();
				while(resultComplaint.next()){
			int complaintID = resultComplaint.getInt("complaintID");
			int auctionID = resultComplaint.getInt("auctionID");
			String buyerUserName = resultComplaint.getString("buyerUserName");
			String description = resultComplaint.getString("description");
			Date dateSubmitted = resultComplaint.getDate("dateSubmitted");
				
				out.println("<tr><td>" + complaintID + "</td>");
				out.println("<td>" + auctionID + "</td>");
				out.println("<td>" + buyerUserName + "</td>");
				out.println("<td>" + description + "</td>");
				out.println("<td>" + dateSubmitted + "</td></tr>");
			}}
		out.println("</table></center>");
//All user orders
		PreparedStatement userOrders = null;
		ResultSet resultOrders = null;
		 userOrders = con.prepareStatement("SELECT Company.invioceID, Company.auctionFee, Auction.highestBid FROM Auction JOIN Company ON Auction.invioceID=Company.invioceID WHERE buyerUserName LIKE ?",resultOrders.TYPE_SCROLL_INSENSITIVE,resultOrders.CONCUR_READ_ONLY);
		userOrders.setString(1,uName);

		 resultOrders= userOrders.executeQuery();
			out.println("<br><center><b>Order Information</b>");
			if(resultOrders.next()==false){out.println("<p> No user order information</p>");}
			else{
				out.println("<table cellpadding='10' style='width=100%'>" + "<tr>"+"<th align='left'>Invioce ID</th>"  + "<th align='left'>Comapny Fee</th>" + "<th align='left'>Winning Bid </th></tr>");

				resultOrders.beforeFirst();
			while(resultOrders.next()){
			int invioceID = resultOrders.getInt("invioceID");
			double auctionFee = resultOrders.getDouble("auctionFee");
			double highestBid = resultOrders.getDouble("highestBid");
			out.println("<tr><td>" + invioceID + "</td>");
			out.println("<td>" + auctionFee + "</td>");
			out.println("<td>" + highestBid + "</td></tr>");
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

