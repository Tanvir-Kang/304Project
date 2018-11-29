<%@ page trimDirectiveWhitespaces="true" import="java.sql.*,java.io.*, data.loginDetails" %><%

// Indicate that we are sending a JPG picture
response.setContentType("image/jpeg");  

// Get the auction id
String auctionid = request.getParameter("auctionid");

if (auctionid == null)
	return;

int idVal = -1;
try{
	idVal = Integer.parseInt(auctionid);
}
catch(Exception e)
{	out.println("Invalid auction id: "+auctionid+" Error: "+e);
	return; 
}

String sql = "SELECT image FROM Book WHERE auctionID = ?";

try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Database connection information
loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();

try ( Connection con = DriverManager.getConnection(url, uid, pw);
    ) 
{
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,idVal);
	ResultSet rst = pstmt.executeQuery();		

	int BUFFER_SIZE = 10000000;
	byte[] data = new byte[BUFFER_SIZE];

	if (rst.next())
	{
		// Copy stream of bytes from database to output stream for JSP/Servlet
		//InputStream istream = rst.getBinaryStream("image");
		//OutputStream ostream = response.getOutputStream();

		
		byte[] istream = rst.getBytes("image");
		OutputStream ostream = response.getOutputStream();


			ostream.write(istream);

		ostream.flush();	
		
		/*
		//byte[] istream = rst.getBytes("image");
		//OutputStream ostream = response.getOutputStream();


			//ostream.write(istream);

		//ostream.flush();	
		*/
	}
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>