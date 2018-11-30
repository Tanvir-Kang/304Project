<!-- 
Tanvir
 -->
<%@ include file="adminAuth.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="data.restoreDatabase"%>
<body>
<div id="header">
		<jsp:include page="adminHeader.jsp" />
	</div>
<div class="header">
		<h1>
			BookBids
		</h1>
		<p>ADMIN FUNCTIONS</p>
	</div>
	
		<nav>
		<a class="active" href="homepage.jsp">Home</a> 
		
	</nav>
<%
restoreDatabase attempt1 = new restoreDatabase();
String fileName = "C:/Users/tanvi/git/304Project/304_Project/Data/order_sql.ddl";
try{
	attempt1.loadData(fileName);

}
catch(Exception ex){
	
}
%>
</body>