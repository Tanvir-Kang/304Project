
public class loginDetails {
	String uid = "<USERNAME>";
	String pw = "<PASSWORD>";
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_<USERNAME>;";
	
	public String getUid() {
		return uid;
	}
	public String getPw() {
		return pw;
	}
	public String getUrl() {
		return url;
	}
	
}