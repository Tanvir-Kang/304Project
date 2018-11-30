<!-- TANVIR



TANVIR-->
<%@ page import="java.sql.*, data.loginDetails"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<title>Write a review</title>
<body>

<div id="header">
		<jsp:include page="header.jsp" />
	
	</div>
		
	<%
	int auction =0;
	String auctionid = null;
	String complaint = request.getParameter("inComplaint");
	Object authUser = session.getAttribute("authenticatedUser");
	String buyerUserName = String.valueOf(authUser);
	
	String sellerUserName = request.getParameter("seller");
	
	 auctionid = request.getParameter("auctionid");
	if(auctionid==null){
	
		auction = 0;
	}
	else{
		auction = Integer.parseInt(auctionid);
	}
	// Making connection
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
	PreparedStatement pst = null;
	ResultSet rst = null;	
	try(Connection con = DriverManager.getConnection(url, uid, pw);){
		
		pst = con.prepareStatement("SELECT complaintID, auctionID FROM Complaint WHERE auctionID = ?");
		pst.setInt(1, auction);
		rst = pst.executeQuery();
//if the result set for a review/complaint is empty then allow a review to be written by including the html form
			if(rst.next()==false){
				
				out.println("<p> Write a review or complaint about: " + sellerUserName + "</p>");
				%><%@ include file="textEntryReview.html" %><% 
				}
			else{
				out.println("<p>It appears you have alreay made a review or complaint about: " + sellerUserName + "</p>");
			}

/*
CREATE TABLE Complaint(
	complaintID  int NOT NULL,
	auctionID   int ,
	sellerUserName  VARCHAR(30),
	buyerUserName VARCHAR(30),
	description   VARCHAR(150),
	dateSubmitted   DATE,
	PRIMARY KEY (complaintID),
	CONSTRAINT FK_Complaint2_Auction2 FOREIGN KEY (auctionID)  REFERENCES Auction(auctionID)
);
*/
Date today = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String dateToStr = format.format(today);
			PreparedStatement pstInsert = null;
			ResultSet rstInsert = null;
			pstInsert = con.prepareStatement("INSERT INTO Complaint (auctionID, sellerUserName,buyerUserName,description, dateSubmitted) VALUES(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstInsert.setInt(1,auction);
			pstInsert.setString(2, sellerUserName);
			pstInsert.setString(3, buyerUserName);
			pstInsert.setString(4,complaint);
			pstInsert.setString(5, dateToStr);
			pstInsert.executeUpdate();
			

	}
	catch(SQLException ex){ out.println(ex);}
	%>
	
	
	</body>