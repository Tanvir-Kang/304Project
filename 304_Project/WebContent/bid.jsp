<!-- SAM





SAM -->
<%@ page import= "java.util.Date" %>
<%@ page import= "java.text.DateFormat" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="auth.jsp"%>
	<!-- ^^^^ Copy and paste this line into the top of your jsp page to
Only allow access to logged in users. -->
	<%
		String user = (String) session.getAttribute("authenticatedUser");
	%>


<%




session = request.getSession(true);
String title = request.getParameter("title");
String bidValue =request.getParameter("value");
Double Bid=null;
if (bidValue != null){
	 Bid = Double.parseDouble(bidValue);}
String auctionId =request.getParameter("auctionId");
int id = Integer.parseInt(auctionId.trim());
String startingPrice =request.getParameter("startingPrice");
Double minBid = Double.parseDouble(startingPrice) + 1.00;
	if (bidValue ==null ){

%>

	<h1>Bid on  <%out.print("'" +title + "'");%></h1>
			<form method= "get" action="bid.jsp">
		
			<input type="number" name="value" step="0.01" placeholder="Min: <%out.print(minBid);%>" min="<%out.print(minBid);%>"  required> 
			<input type ="hidden" name = "auctionId" value="<%out.print(id);%>">
			<input type ="hidden" name = "startingPrice" value="<%out.print(minBid);%>">
			<input type ="hidden" name = "title" value="<%out.print(title);%>">
			 
			<input type="submit" value="Place Your Bid">
 			</form> 
<%

}else if (bidValue !=null ){
	SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
	Calendar cal = Calendar.getInstance();
	String bidTime = s.format(cal.getTime()); 
// Making connection
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	Connection con = DriverManager.getConnection(url, uid, pw);
	try{
	String SQL = "INSERT INTO Bids (auctionID, buyerUserName, bidAmount, dates) VALUES (?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	pstmt.setDouble(1, id);
	pstmt.setString(2, user);
	pstmt.setDouble(3, Bid);
	pstmt.setString(4, bidTime );
	pstmt.executeUpdate();
	
	String SQL4 = "SELECT buyerUserName from PaymentInfo WHERE buyerUserName= ? ";
	PreparedStatement pstmt4 = con.prepareStatement(SQL4);
	pstmt4.setString(1, user);
	ResultSet rst = pstmt4.executeQuery();
	
	for (;;){
		if (rst.next())
			break;
	String SQL3 = "INSERT INTO PaymentInfo VALUES (?,'null');";
	PreparedStatement pstmt3 = con.prepareStatement(SQL3);
	pstmt3.setString(1, user);
	pstmt3.executeUpdate(); break;}
	

	
	String SQL2 = "UPDATE Auction SET highestBid= ?,buyerUserName=?, billingAddress=? WHERE Auction.auctionID = ?";
	PreparedStatement pstmt2 = con.prepareStatement(SQL2);
	pstmt2.setString(2, user);
	pstmt2.setDouble(1, Bid);
	pstmt2.setDouble(4, id);
	pstmt2.setString(3,"null");
	pstmt2.executeUpdate();
	
		%>You've Submitted A Bid<% 
	
	




	




 %>

		<meta http-equiv="Refresh" content="2;url=listAuctions.jsp">
	
	<%
		
	
	}catch(SQLException ex){
		out.println(ex);}
	}
	%>
</body>
</html>