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
String auctionId = request.getParameter("auctionId");
String user = (String) session.getAttribute("authenticatedUser");
if (user == null)
	response.sendRedirect("login.jsp");
session = request.getSession(true);

// Making connection
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	Connection con = DriverManager.getConnection(url, uid, pw);
	try{
	String SQL = "INSERT INTO savedAuctions (auctionID, buyerUserName) VALUES (?,?)";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, auctionId);
	pstmt.setString(2, user);
	
	pstmt.executeUpdate();
	
	
	}catch(SQLException ex){
		out.println(ex);}
	
		%>The auction has been saved to your 'Watching' List<% 
	
	




	




 %>
	<script>
		setTimeout("account.jsp?feature=selling");
	</script>
	<%
		
	
	%>
</body>
</html>