package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

 
// /image?id=123
@WebServlet(urlPatterns = { "/image" })
public class imageServlet extends HttpServlet {
 private static final String SQL_FIND = "select image from Book where image is not null";
  public imageServlet() {
      super();
  }
 
  /*private Book getImageInTable(Connection conn, int auctionId) throws SQLException {
      String sql = "Select ISBN, auctionID, title, sellerUserName, subject, author, edition, quality, startPrice, description, image"
              + " from Book where auctionId = ?";
      PreparedStatement pstm = conn.prepareStatement(sql);
      pstm.setInt(1, auctionId);
      ResultSet rs = pstm.executeQuery();
      if (rs.next()) {
          Long isbn = Long.parseLong(rs.getString("isbn"));
          byte[] imageData = rs.getBytes("Image_Data");
          String imageFileName = rs.getString("Image_File_Name");
          return new Book(isbn, name, imageFileName, imageData);
      }
      return null;
  }*/
 
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
	  String imageName = request.getPathInfo().substring(1);
      Connection con = null;
      try {
  		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (java.lang.ClassNotFoundException e) {
		}
		// Making connection
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();

		con = DriverManager.getConnection(url, uid, pw);
		PreparedStatement pstmt = con.prepareStatement(SQL_FIND);
		ResultSet rst = pstmt.executeQuery();
		   if (rst.next()) {
               byte[] content = rst.getBytes("image");
               response.setContentType(getServletContext().getMimeType(imageName));
               response.setContentLength(content.length);
               response.getOutputStream().write(content);
           } else {
               response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
           }
 
      } catch (Exception e) {
          throw new ServletException(e);
      }
  }
 
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      doGet(request, response);
  }
 
}
