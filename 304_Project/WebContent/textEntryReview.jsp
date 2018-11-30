<!-- Tanvir -->

<%@ page import="java.sql.*, data.loginDetails, java.util.Random"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<title> Submit</title>
</head>
<body>
<%
/*CREATE TABLE Complaint(
complaintID  int NOT NULL,
auctionID   int ,
sellerUserName  VARCHAR(30),
buyerUserName VARCHAR(30),
description   VARCHAR(150),
dateSubmitted   DATE,
PRIMARY KEY (complaintID),
CONSTRAINT FK_Complaint2_Auction2 FOREIGN KEY (auctionID)  REFERENCES Auction(auctionID)
);*/

//getting buyer
	Object authUser = session.getAttribute("authenticatedUser");
	String buyerUserName = String.valueOf(authUser);
//getting seller
	Object sellerObject = session.getAttribute("seller");
	String sellerUserName = String.valueOf(sellerObject);
//getting auctionID
	Object auction = session.getAttribute("auctionid");
	int auctionID = (Integer) auction;
//Getting txt review
	String review = request.getParameter("inComplaint");
//I am going to leave date null, just need all PK to get complaint id generated and will use key from RS	
	out.println("<p>"+ sellerUserName +auctionID + review +  "</p>");

	// Making connection
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	} catch (java.lang.ClassNotFoundException e) {
		out.println("ClassNotFoundException: " + e);
	}
%>
<%
//TODO make a proper system for the PK m8
int complaintID = (int)(Math.random() * 100 + 1);
PreparedStatement pstmt = null;
ResultSet rst = null;
try (Connection con = DriverManager.getConnection(url, uid, pw);) {
	String sql = "INSERT INTO Complaint (complaintID, auctionID, sellerUserName, buyerUserName, description) VALUES (?,?,?,?,?)";
	 pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	pstmt.setInt(1, complaintID);
	 pstmt.setInt(2,auctionID);
	 pstmt.setString(3, sellerUserName);
	 pstmt.setString(4, buyerUserName);
	 pstmt.setString(5, review);
	 pstmt.executeUpdate();
	 ResultSet keys = pstmt.getGeneratedKeys();
	 keys.next();
	 complaintID = keys.getInt(1);
	 complaintID =+1;
}


catch (SQLException ex) {
	out.println(ex);
}
%>
</body>
</html>