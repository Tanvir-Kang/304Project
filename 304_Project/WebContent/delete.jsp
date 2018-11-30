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
%><%
String id = request.getParameter("auctionID");
int Id = Integer.parseInt(id.trim());
try { // Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
}
loginDetails ld = new loginDetails();
String url = ld.getUrl();
String uid = ld.getUid();
String pw = ld.getPw();
Connection con = DriverManager.getConnection(url, uid, pw);

try{
	String SQL = "DELETE FROM savedAuctions WHERE buyerUserName=? AND auctionID=?;";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	pstmt.setInt(2, Id);
	pstmt.setString(1, user);

	pstmt.executeUpdate();
}catch(SQLException ex){
	out.println(ex);}


%>
You've Deleted an Auction from your watching list
  		<meta http-equiv="Refresh" content="2;url=account.jsp?feature=watching">
 
</body>
</html>