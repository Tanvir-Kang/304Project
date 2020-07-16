package data;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class bookUploadServlet extends HttpServlet {
     
	private static final long serialVersionUID = 1L;
	// database connection settings
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	String user = (String) request.getSession(false).getAttribute("authenticatedUser");
    	String title =request.getParameter("title");	
    	String isbn = request.getParameter("isbn");	
    	String author =request.getParameter("author");	
    	String edition =request.getParameter("edition");	
    	String quality = request.getParameter("quality");	
    	String startPrice =request.getParameter("startPrice");	
    	String description = request.getParameter("description");	
    	String subject =request.getParameter("subject");	
    	String endDate = request.getParameter("endDate");	
    	Date startDate= new Date(System.currentTimeMillis());
         
        InputStream istream = null; // input stream of the upload file
         
        
        
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("pic");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            istream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
        	try {
        		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	} catch (java.lang.ClassNotFoundException e) {
        		message = "ERROR: " + e.getMessage();
                e.printStackTrace();
        	}
            // connects to the database
        	Connection con = DriverManager.getConnection(url, uid, pw);
        	
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
			if (checkuser == false && checkISBN == false){
				 message = "You can't post two books with the same ISBN. Redirecting to account page...";
				 request.setAttribute("Message", message);
				 getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
				canStartAuction=false;}

			if (canStartAuction) {
        	
        	
        	
        	
        	String sql = "INSERT INTO Auction (sellerUserName,buyerUserName,startDate, endDate, highestBid) VALUES (?,?,?,?,?)";
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
			pstmt2.setString(5, startPrice);
			
			
            // constructs SQL statement
			int auctionId = 0;
			try {
				SQL = "SELECT sellerUserName, ISBN from Book";
				pstmt = con.prepareStatement(SQL);
				pstmt2.executeUpdate();
				ResultSet rss = pstmt.executeQuery();

				ResultSet keys = pstmt2.getGeneratedKeys();
				keys.next();
				int auctionid = keys.getInt(1);
				auctionId = auctionid;
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Auction");
			request.setAttribute("repostingBooks", "You're book's auction is now open!");
			String SQL3 = "INSERT INTO Book VALUES (?,?,?,?,?,?,?,?,?,?,?)";
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
			request.removeAttribute("repostingBooks");
             
            if (istream != null) {
                // fetches input stream of the upload file and changes into byte array
            	byte[] image = new byte[(int) istream.available()];
        		istream.read(image);
        		istream.close();
        		pstmt3.setBytes(11, image);
            }
 
            // sends the statement to the database server
            int row = pstmt3.executeUpdate();
            con.close();
            if (row > 0) {
                message = "Your book has been posted for sale! Redirecting to account page...";
            } }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        } 
    }
}
