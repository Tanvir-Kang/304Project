<!-- TANVIR



TANVIR-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<%@ page import="data.loadData" %>


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
		<a class="active" href="homepage.html">Home</a> 
		
	</nav>
	
	<h2 align="center" style="font-family: Arial;" style="color:#0D2038">Admin operations:</h2>

	<div align="center">Select one of the following functions </div>
	
<form action="userOperations.jsp">
    <input type="submit" value="User operations" />
</form>	
<form action="auctionOperations.jsp">
    <input type="submit" value="Auction operations" />
</form>	
<form action="listAllOrders.jsp">
    <input type="submit" value="Show all orders" />
</form>	


	
</body>
</html>