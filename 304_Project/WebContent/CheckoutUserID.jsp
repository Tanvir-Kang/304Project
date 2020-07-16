
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import ="java.text.*"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
button {
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 14px;
	background: #FFFACD;
	font-size: 17px;
	border: none;
	cursor: pointer;
}
</style>

<div id="header">
		<jsp:include page="header.jsp" />
	</div>
				
<body>
<%//String login=null;
//login= (request.getParameter("login"));
	

//if (login==null){
	String user = (String) session.getAttribute("authenticatedUser");
	
	String SQL4="DELETE FROM Book WHERE auctionID=?";	
	String SQL3="DELETE FROM savedAuctions WHERE auctionID=?";		
	String SQL2="DELETE FROM Bids WHERE auctionID=?";			
	String SQL="DELETE FROM Auction WHERE auctionID=?";	
	try 
	{
		
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();
		Connection con = DriverManager.getConnection(url, uid, pw);
		
		String ID = request.getParameter("auctionID").trim();
		int id = Integer.parseInt(ID);
		
		PreparedStatement pstmt = con.prepareStatement(SQL4);
		pstmt.setInt(1, id);	
		pstmt.executeUpdate();
		
		pstmt = con.prepareStatement(SQL3);
		pstmt.setInt(1, id);	
		pstmt.executeUpdate();
		
		pstmt = con.prepareStatement(SQL2);
		pstmt.setInt(1, id);	
		pstmt.executeUpdate();
	
		pstmt = con.prepareStatement(SQL);
		pstmt.setInt(1, id);	
		pstmt.executeUpdate();
	
	DecimalFormat df = new DecimalFormat("#.##");
	%>
	<h2 align="center" style="font-size: 40px;">Confirm CheckOut</h2>
	
	
	<h1 align="left" style="font-size: 20px;">Auction pre-tax and fee total: $<%out.print(request.getParameter("price"));%></h1>
	<h1 align="left" style="font-size: 20px;">BC sales tax 7%: $<%out.print(df.format(Double.parseDouble(request.getParameter("price").trim())*0.07));%></h1>
<h1 align="left" style="font-size: 20px;">Federal sales tax 5%: $<%out.print(df.format(Double.parseDouble(request.getParameter("price").trim())*0.05));%></h1>
	
<h1 align="left" style="font-size: 20px;">BookBids 1% fee: $<%out.print(df.format(Double.parseDouble(request.getParameter("price").trim())*0.15));%></h1>

<h1 align="left" style="font-size: 30px;">Auction Total: $<%out.print(df.format((Double.parseDouble(request.getParameter("price").trim())*0.01) + Double.parseDouble(request.getParameter("price").trim())*0.05+Double.parseDouble(request.getParameter("price").trim())*0.07+Double.parseDouble(request.getParameter("price").trim())));%></h1>

<form method="get" action="account.jsp">
		<table align="center">
			<tr><input type="hidden" value="bids" name="feature">
				<td align="center" style="font-size: 25px;"></td>
				<td align="center"><button type="submit">Pay</button></td>
				
					
				<% if (request.getParameter("login")!=null){ %>


	<h2 align="center" style="font-size: 40px;">Check Out</h2>

	<form method="get" action="account.jsp">
	
		<table align="center">
			<tr>
				<td align="center" style="font-size: 25px;">Customer ID:</td>
				<td>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="center"><input type="text" size="20"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="center" style="font-size: 25px;">Password:</td>
				<td>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="center"><input type="text" name="UserID" size="20"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<input type="hidden" value="yup" name="login">
			<input type="hidden" value="<%request.getParameter("auctionId");%>"
				name="auctionID">
			<input type="hidden" value="<%request.getParameter("seller");%>"
				name="seller">
			<input type="hidden" value="<%request.getParameter("price");%>"
				name="price">
		
			
			
			<tr>
				<td align="center"><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>
	
	<%}}catch (SQLException ex) {
		out.println(ex);}
	
   %>
			</tr>
		</table>
		
		
		
	</form>

</body>
</html>