package data;

public class Book {
	private Long isbn;
	private int auctionId;
	private String title;
	private String sellerUserName;
	private String subject;
	private String author;
	private int edition;
	private int quality;
	private double startPrice;
	private String desc;
	private byte[] imageData;

	public Book() {

	}

	public Book(Long isbn, int auctionId, String title, String sellerUserName, String subject, String author,
			int edition, int quality, double startPrice, String desc, byte[] imageData) {
		this.isbn = isbn;
		this.auctionId = auctionId;
		  this.title = title;
		  this.sellerUserName = sellerUserName;
		  this.subject = subject;
		  this.author = author;
		  this.edition = edition;
		  this.quality = quality;
		  this.startPrice = startPrice;
		  this.desc = desc;
		  this.imageData = imageData;
	}
	public Long getIsbn() {
        return isbn;
    }
 
    public void setIsbn(Long id) {
        this.isbn = isbn;
    }
	public int getAuctionId() {
        return auctionId;
    }
 
    public void setAuctionId(Long id) {
    	this.auctionId = auctionId;
    }
	public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
    	this.title = title;
    }
	public String getSellerUserName() {
        return sellerUserName;
    }
 
    public void setSellerUserName(String sellerUserName) {
    	this.sellerUserName = sellerUserName;
    }
	public String getSubject() {
        return subject;
    }
 
    public void setSubject(String title) {
    	this.subject = subject;
    }
	public String getAuthor() {
        return author;
    }
 
    public void setAuthor(String title) {
    	this.author = author;
    }
	public byte[] getImageData() {
        return imageData;
    }
 
    public void setImageData(byte[] imageData) {
    	this.imageData = imageData;
    }

}
