/*Sam
 * 
 * This servlet was developed with the help of the following tutorial 
 * https://www.youtube.com/watch?v=T63VJwkKq1A
 * 
 * 
 * 
 * Sam
 */

import data.loginDetails;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;


import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;

import javax.servlet.http.Part;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;


@WebServlet ("/PostAuction")
//file sizes for uploading and printing
@MultipartConfig(fileSizeThreshold = 2048 * 2048 *4,
	maxFileSize = 2048 * 2048 * 5,
	maxRequestSize = 2048 * 2048 *10)

public class PostAuction extends HttpServlet {
	
	
@Override
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
					response.setContentType("text/html:charset=UTF-8");
					PrintWriter out = response.getWriter();
					
					
					String user = request.getParameter("user");
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

	
	Part picture = request.getPart("pic");
	String photoName= getFileName(picture);
	String savePath = "/Users/samuelpeters/git/304Project/304_Project/WebContent/images/" + File.separator + photoName;
	File photoSaveDirectory = new File(savePath);
	
	picture.write(savePath + File.separator);
	

	
	if (title !=null && isbn !=null && author != null && edition !=null && quality != null && startPrice != null && description != null && subject != null && endDate != null  ){
	try {
		
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		Class.forName(driver).newInstance();
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
					out.print("You can't post the same book twice");
					canStartAuction=false;}

				if (canStartAuction) {
				
				
						String sql= "INSERT INTO Auction (sellerUserName,buyerUserName,startDate, endDate) VALUES (?,?,?,?)";
						// code provided by the lab was edited, the injected statement.RETURN_GENERATED_KEYS was turned into a PreparedStatement in the line below
						PreparedStatement pstmt2 = con.prepareStatement(sql , PreparedStatement.RETURN_GENERATED_KEYS);	
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
					
					
						int auctionId=0;
						try{
						pstmt2.executeUpdate();
							ResultSet rss = pstmt.executeQuery();
						
							ResultSet keys = pstmt2.getGeneratedKeys();
							keys.next();
							int auctionid = keys.getInt(1);
							auctionId=auctionid;
						}catch(SQLException ex){
							out.println(ex);}
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("Select * from Auction");
							while (rs.next()){
							out.println(" aID " + rs.getInt("auctionId"));
							out.println(" seller " + rs.getString("sellerUserName"));
							out.println(" sDate " + rs.getString("startDate"));
							out.print(" edate " + rs.getString("endDate"));
							}
						
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
				
					sql = "INSERT INTO productImage VALUES (?,?) ";
					PreparedStatement prst = con.prepareStatement(sql);
					prst.setInt(1, auctionId);
					prst.setString(2, savePath);
					
					prst.executeUpdate();
				
					
				}
		
	} catch (Exception e) { out.println (e); }
	}
	}
	

private String getFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    System.out.println("content-disposition header= "+contentDisp);
    String[] tokens = contentDisp.split(";");
    for (String token : tokens) {
        if (token.trim().startsWith("filename")) {
            return token.substring(token.indexOf("=") + 2, token.length()-1);
        }
    }
    return "";
}
}