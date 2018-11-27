<!-- SAM





SAM -->
<%@ page import= "java.util.Date" %>
<%@ page import= "java.text.DateFormat" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = (String) session.getAttribute("authenticatedUser");
if (user == null)
	response.sendRedirect("login.jsp");
session = request.getSession(true);
String title = request.getParameter("title");
String bidValue =request.getParameter("value");
if (bidValue != null){
	Double bid = Double.parseDouble(bidValue);}
String auctionId =request.getParameter("auctionId");
String startingPrice =request.getParameter("startingPrice");
Double minBid = Double.parseDouble(startingPrice);
	if (bidValue ==null ){

%>

	<h1>Bid on  <%out.print("'" +title + "'");%></h1>
			<form method= "get" action="bid.jsp">
		
			<input type="number" name="value" placeholder="Min: <%out.print(startingPrice);%>" min="<%out.print(startingPrice);%>" max="(<%out.print(startingPrice);%> +100)" required> 
			<input type ="hidden" name = "auctionId" value="<%out.print(auctionId);%>">
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
	pstmt.setString(1, auctionId);
	pstmt.setString(2, user);
	pstmt.setString(3, bidValue);
	pstmt.setString(4, bidTime );
	
	pstmt.executeUpdate();
	
		%>You've Submitted A Bid<% 
	
	




	




 %>
	<script>
		setTimeout("account.jsp?feature=selling");
	</script>
	<%
		
	
	}catch(SQLException ex){
		out.println(ex);}
	}
	%>
</body>
</html>