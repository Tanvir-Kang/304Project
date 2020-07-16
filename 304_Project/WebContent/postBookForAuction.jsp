<!-- SAM





SAM -->
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
	String user = (String) session.getAttribute("authenticatedUser");
	session = request.getSession(true);
	out.print(user);

	String title = request.getParameter("title");
	String isbn = request.getParameter("isbn");
	String author = request.getParameter("author");
	String edition = request.getParameter("edition");
	String quality = request.getParameter("quality");
	String startPrice = request.getParameter("startPrice");
	String description = request.getParameter("description");
	String subject = request.getParameter("subject");
	String endDate = request.getParameter("endDate");
	Date startDate = new Date(System.currentTimeMillis());

	if (title != null && isbn != null && author != null && edition != null && quality != null
			&& startPrice != null && description != null && subject != null && endDate != null) {

		// Making connection
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();
		Connection con = DriverManager.getConnection(url, uid, pw);
		try {
			String SQL = "SELECT sellerUserName, ISBN from Book";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			ResultSet rst = pstmt.executeQuery();
			boolean checkuser = true;
			boolean checkISBN = true;
			while (rst.next()) {
				if (rst.getString("sellerUserName").equals(user))
					checkuser = false;
				if (rst.getString("ISBN").equals(isbn))
					checkISBN = false;
			}
			boolean canStartAuction = true;
			if (checkuser == false && checkISBN == false) {
				session.setAttribute("repostingBooks", "You can't post the same book twice");
				canStartAuction = false;
			}

			if (canStartAuction) {

				String sql = "INSERT INTO Auction (sellerUserName,buyerUserName,startDate, endDate) VALUES (?,?,?,?)";
				// code provided by the lab was edited, the injected statement.RETURN_GENERATED_KEYS was turned into a PreparedStatement in the line below
				PreparedStatement pstmt2 = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
				// setting the queery values with the  submitted and executing the code

				java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
				int lengthOfAuction = Integer.parseInt(endDate);
				//Adding the # of days the customer has specified their auction to be 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, lengthOfAuction);
				String updatedEndDate = sdf.format(cal.getTime());

				pstmt2.setString(1, user);
				pstmt2.setString(2, user);
				pstmt2.setDate(3, sqlStartDate);
				pstmt2.setString(4, updatedEndDate);
%>Rock the house you started an auction
<%
	int auctionId = 0;
				try {
					pstmt2.executeUpdate();
					ResultSet rss = pstmt.executeQuery();

					ResultSet keys = pstmt2.getGeneratedKeys();
					keys.next();
					int auctionid = keys.getInt(1);
					auctionId = auctionid;
				} catch (SQLException ex) {
					out.println(ex);
				}

				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("Select * from Auction");
				while (rs.next()) {
					out.println(" aID " + rs.getInt("auctionId"));
					out.println(" seller " + rs.getString("sellerUserName"));
					out.println(" sDate " + rs.getString("startDate"));
					out.print(" edate " + rs.getString("endDate"));
				}
				session.setAttribute("repostingBooks", "You're book's auction is now open!");
				out.println("<h1>You're book's auction is now open! </h1>");
				String SQL3 = "INSERT INTO Book VALUES (?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt3 = con.prepareStatement(SQL3);
				pstmt3.setString(1, isbn);
				pstmt3.setInt(2, auctionId);
				pstmt3.setString(3, title);
				pstmt3.setString(4, user);
				pstmt3.setString(5, subject);
				pstmt3.setString(6, author);
				pstmt3.setString(7, edition);
				pstmt3.setString(8, quality);
				pstmt3.setString(9, startPrice);
				pstmt3.setString(10, description);
				pstmt3.executeUpdate();
				session.removeAttribute("repostingBooks");
%>Rock the house you posted a book<%
	
%>
<script>
	setTimeout("account.jsp?feature=selling");
</script>
<%
	} else {
				response.sendRedirect("account.jsp?feature=selling");
			}
		} catch (SQLException ex) {
			out.println(ex);
		}
	}
%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>




<
