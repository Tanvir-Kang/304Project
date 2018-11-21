<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>

<!--Sam




	Sam --> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<style>

<!-- help with the sideBar came from this tutorial: https://bootstrapious.com/p/bootstrap-sidebar -->

l {colour: black;
	font-family: 'font-family: 'Rubik', sans-serif;
	 sans-serif;}
	
body {
   font-family: archivo;
   font-size: 1em;
   color: #333;
}
.topBar {
position:absolute;
left:160px;
right:0;
top: 0;
height:100px;
font-family: 'Rubik';
font-size: 50px;
background-color: #6FBEE7;


}
.pmain{
top: 100px;
right:0;
left: 0;
bottom:0;
background-color: pink;

}
.sideBar {
    height: 100%; /* Full-height: remove this if you want "auto" height */
    width: 160px; /* Set the width of the sidebar */
    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1; /* Stay on top */
    top: 0; /* Stay at the top */
    left: 0;
    background-color: #6FBEE7; /* Black */
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 20px;
}
.sideList {
	 margin-top: -100px;
 	top: 50%;
    left: 0; 
    width: 130px;
    position: fixed;
    z-index: 1; 
  
    background-color: #6FBEE7;
    overflow-x: hidden; 
    padding-top: 20px;
}


li{
list-style-type: none;
}
li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}
li a:hover{
background-color: #66b9e5;
    color: white;
}

.sideList a {
 	text-align: center; 
    padding: 0px;
    margin:-0px;
    font: Rubik;
    font-size: 25px;
    color: white;
}

</style>
<body>

<%

String custId = request.getParameter("customerId");
//Getting customer's password 
String custPass = request.getParameter("customerPassword");

try { 
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
	out.println("ClassNotFoundException: " + e);
}
{
	// Making connection
	
	
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_speters;";
			String uid = "speters";
			String pw = "63685507";

	System.out.println("Connecting to database.");

	Connection con = DriverManager.getConnection(url, uid, pw);
	
	
	// confirming username and password
PreparedStatement checkUser = con.prepareStatement("SELECT userName, password FROM webUser WHERE userName = ? AND password = ?");
checkUser.setString(1, custId );
checkUser.setString(2, custPass );

ResultSet checkNameAndPassword = checkUser.executeQuery();

boolean correctUserAndPassword = true;
while( checkNameAndPassword.next() ) {
	correctUserAndPassword = false;
}


if( correctUserAndPassword ) {
	String chombo = "Invalid username or password";
%>	
	
	<jsp:forward page="checkout.jsp">
	<jsp:param name="error" value="Invalid username or password" /> </jsp:forward>
<% 
}
}
	
	%>	
		
	


<div class="topBar">

<center><b>BookBids</b></center>

</div>

	<div class ="sideBar">
		<!-- The tiny login and register links -->
		<div class ="sideList">
		<ul > 
				<li ><a href ="login.jsp"> Login </a></li>
				<li ><a href ="register.jsp"> Register </a></li>
				<!-- the links to home, bids, account--> 
				<li><a href ="account.jsp">Account</a></li>
				<li ><a href ="homepage.html#home">Home</a></li>
				<li ><a href ="bids.jsp">Bids</a></li>
				
		</ul>
	</div>
</div>
	
<div class="pmain">
		<h1>
			<b>BookBids</b>
		</h1>
		<p>Watch the bids start rolling in.</p>
	</div>
</body>
