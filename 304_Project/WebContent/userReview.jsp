<!-- TANVIR



TANVIR-->
<%@ page import="java.sql.*, data.loginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<title>Home Page</title>
<body>
<head>
<title>Write a Review</title>
</head>
<div id="header">
	<jsp:include page="header.jsp" />

</div>


<%
	Object authUser = session.getAttribute("authenticatedUser");
	String buyerUserName = String.valueOf(authUser);

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
	PreparedStatement pst = null;
	ResultSet rst = null;
	try (Connection con = DriverManager.getConnection(url, uid, pw);) {

		pst = con.prepareStatement(
				"SELECT Auction.auctionID, Auction.sellerUserName, highestBid, title FROM Auction JOIN Book ON Auction.auctionID = Book.auctionID WHERE buyerUserName LIKE ?",
				rst.TYPE_SCROLL_INSENSITIVE, rst.CONCUR_READ_ONLY);
		pst.setString(1, buyerUserName);
		rst = pst.executeQuery();

		if (rst.next() == false) {
			out.println("<p>You have not won any auctions</p>");
		} else {
			rst.beforeFirst();
			out.println("<p>Select one of your previous orders to leave a review about the seller </p>");
			out.println("<p>Feel free to add in information about the condition of the item or any complaints you may have</p>");

			out.println("<center><table cellpadding='10' style='width=100%'>"
					+ "<tr><th align='left'>Auction ID</th>" + "<th align='left'>Seller</th>"
					+ "<th align='left'>Your winning bid </th>" + "<th align='left'>Book title</th>"
					+ "<th align='left'>Click to make a review</th></tr>");
			while (rst.next()) {
				int auctionid = rst.getInt("auctionID");
				String seller = rst.getString("sellerUserName");
				Double winningbid = rst.getDouble("highestBid");
				String title = rst.getString("title");
				out.println("<tr><td>" + auctionid + "</td>");
				out.println("<td>" + seller + "</td>");
				out.println("<td>" + winningbid + "</td>");
				out.println("<td>" + title + "</td>");
				out.println("<td>" + "<a href=writeReview.jsp?userName=" + buyerUserName + "&auctionid="
						+ auctionid + "&seller=" + seller + ">" + "Write a review" + "</a></td></tr>");

			}
			out.println("</table></center>");
		}

	} catch (SQLException ex) {
		out.println(ex);
	}
%>


</body>
