<!-- TANVIR



TANVIR-->
<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<body>
<div id="header">
		<jsp:include page="adminHeader.jsp" />
	</div>
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
out.println("<p>Deleting user: " + input + "</p>");

%>	


<%
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
%>


<%
try(Connection con = DriverManager.getConnection(url, uid, pw);){
	PreparedStatement psmt = con.prepareStatement("DELETE FROM webUser WHERE userName = ?");
	psmt.setString(1, input);
	psmt.executeUpdate();
	
	out.println("<p>Deleted Successfully " + input + "</p>");

}
catch(SQLException ex){
	out.println(ex);
}
%>
</body>
</html>
	
	
	
	