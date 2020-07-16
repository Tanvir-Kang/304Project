package data;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class restoreDatabase {
	public static void loadData(String fileName) throws Exception
	{		
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();

		
		System.out.println("Connecting to database.");

		Connection con = DriverManager.getConnection(url, uid, pw);
				
		
		
	    try
	    {
	        // Create statement
	        Statement stmt = con.createStatement();
	        
	        Scanner scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;
	            System.out.println(command);        // Uncomment if want to see commands executed
	            try
	            {
	            	stmt.execute(command);
	            }
	            catch (Exception e)
	            {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
	            	System.out.println(e);
	            }
	        }	 
	        scanner.close();
	    }
	    catch (Exception e)
	    {
	        System.out.println(e);
	    }   
	}
}
