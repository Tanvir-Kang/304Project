
<!--Sam




	Sam --> 


<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
</head>
<%String feature = request.getParameter("feature"); %>


<style>

<!-- help with the sideBar came from this tutorial: https://bootstrapious.com/p/bootstrap-sidebar -->

l {colour: black;
	font-family: 'font-family: 'Rubik', sans-serif;
	 sans-serif;}
	
#body {
	font-family: archivo;
	font-size: 1em;
	color: #333;
}
#topBar {
	position:absolute;
	left:160px;
	right:0;
	top: 0;
	height:100px;
	font-family: 'Rubik';
	font-size: 50px;
	background-color: #6FBEE7;
}

.main{
 	position: fixed;
 	margin-top: 90px;
 	margin-left:150px;
 	width:100%;
 	height: 100%;
background-color: #6FBEE7;

}
#sideBar {
    height: 100%; /* Full-height: remove this if you want "auto" height */
    width: 160px; /* Set the width of the sidebar */
    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1; /* Stay on top */
    top: 0; /* Stay at the top */
   	left:0;
    background-color: #133054; /* Black */
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 20px;
}
#sideList {
	margin-top: -180px;
 	top: 50%;
 	margin-left: 100;
    width: 150px;
    position: fixed;
    z-index: 1; 
    background-color: #133054;
   
    padding-top: 20px;
}
.sideBarButton {
	border: 1px solid #133054;
	display: block;
	width: 158px;
	left-margin:-2px;
	font:Rubik;
    background-color: #133054;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    margin: 4px 2px;
    cursor: pointer;
    hover: #66b9e5;
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
.sideBarButton:hover{
background-color: #66b9e5;
    color: white;
}

#sideList a {
 	text-align: center; 
    padding: 0px;
   
    font: Rubik;
    font-size: 25px;
    color: white;
}
#smallLogo {
top-margin:50;
left-margin:-50;
}
#pageTitle { 
top-margin: 100;}
</style>
<body>
	<div id="topBar">
		<div id="pageTitle">
			<center><b>BookBids</b></center>
		</div>
	
	</div>

	<div id ="sideBar">
	<img src=".git/304Project/304_Project/logo.png" alt="logo" id="smallLogo">

		<div id ="sideList">
						<form method="get" action="account.jsp">
							<input type="hidden" value="selling" name="feature" >
							<button type="submit" class="sideBarButton">Selling</button>
						</form>
						<form method="get" action="account.jsp">
							<input type="hidden" value="bids" name="feature" >
							<button type="submit" class="sideBarButton">Bids</button>
						</form>
							<form method="get" action="account.jsp">
							<input type="hidden" value="watching" name="feature" >
							<button type="submit" class="sideBarButton">Watching</button>
						</form>
							
							<form method="get" action="account.jsp">
							<input type="hidden" value="history" name="feature" >
							<button type="submit" class="sideBarButton">History</button>
						</form>
						
							<form method="get" action="account.jsp">
							<input type="hidden" value="Account" name="feature" >
							<button type="submit" class="sideBarButton">Account</button>
						</form>
							<form method="get" action="homepage.jsp">
							<button type="submit" class="sideBarButton">Home</button>
						</form>
			</div>
		</div>

	
	<div class="main">
		<p></p>
	</div>
</body>
