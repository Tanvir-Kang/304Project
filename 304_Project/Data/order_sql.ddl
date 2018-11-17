DROP TABLE Book;
DROP TABLE Complaint;
DROP TABLE Bids;
DROP TABLE ShippingAddress;
DROP TABLE Shipment;
DROP TABLE CreditCard;
DROP TABLE Paypal;
DROP TABLE Bitcoin;
DROP TABLE Auction;
DROP TABLE Company;
DROP TABLE PaymentInfo;
DROP TABLE webUser;


CREATE TABLE webUser(
	userName  VARCHAR(30)    NOT  NULL,
	password     VARCHAR(20),
	firstName   VARCHAR(30),
	lastName    VARCHAR(30),
	email      VARCHAR(50),
	phonenum  VARCHAR(12),
	birthdate  DATE,
	PRIMARY KEY (userName)
);

CREATE TABLE PaymentInfo(
	buyerUserName  VARCHAR(30)    NOT  NULL,
	billingAddress   VARCHAR(50) NOT  NULL,
	PRIMARY KEY (billingAddress,buyerUserName),
	CONSTRAINT FK_PaymentInfo_webUser FOREIGN KEY (buyerUserName)  REFERENCES  webUser(userName) ON DELETE NO action ON UPDATE CASCADE
);

CREATE TABLE Company(
	invioceID     int  NOT NULL,
	auctionFee     decimal(15,2),
	PRIMARY KEY (invioceID)
);

CREATE TABLE Auction(
	auctionID int NOT NULL,
	billingAddress   VARCHAR(50),
	startDate  DATETIME,
	endDate  DATETIME,
	highestBid   decimal(15,2),
	sellerUserName  VARCHAR(30) NOT NULL,
	buyerUserName  VARCHAR(30) NOT NULL,
	invioceID     int ,
	PRIMARY KEY (auctionID),
	CONSTRAINT FK_Auction_webUser FOREIGN KEY (sellerUserName)  REFERENCES  webUser(userName),
	CONSTRAINT FK_Auction_PaymentInfo FOREIGN KEY (billingAddress,buyerUserName)  REFERENCES  PaymentInfo(billingAddress,buyerUserName),
	CONSTRAINT FK_Auction_Company FOREIGN KEY (invioceID)  REFERENCES Company(invioceID)
);

CREATE TABLE Book (
	ISBN   VARCHAR(50)       NOT NULL,
	auctionID   int      NOT NULL,
	title  VARCHAR(30),
	sellerUserName  VARCHAR(30)  NOT NULL,
	subject     VARCHAR(30),
	author   VARCHAR(30),
	edition    INTEGER,
	quality     int,
	startPrice   decimal(15,2),
	description  VARCHAR(150),
	PRIMARY KEY (auctionID,sellerUserName,ISBN),
	CONSTRAINT FK_Book_Auction FOREIGN KEY (auctionID)  REFERENCES Auction(auctionID),
	CONSTRAINT FK_Book_User FOREIGN KEY (sellerUserName)  REFERENCES webUser(userName)
);

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

CREATE TABLE Bids(
	auctionID   int  NOT NULL,
	buyerUserName VARCHAR(30)  NOT NULL,
	bidAmount  decimal(15,2),
	dates   DATETIME,
	PRIMARY KEY (buyerUserName,auctionID),
	CONSTRAINT FK_Bids_User FOREIGN KEY (buyerUserName)  REFERENCES  webUser(userName),
	CONSTRAINT FK_Bids_Auction FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID)
);

CREATE TABLE ShippingAddress(
	userName  VARCHAR(30),
	postalZipcode     VARCHAR(10),
	street    VARCHAR(50),
	city  VARCHAR(30),
	provinceState    VARCHAR(50),
	country   VARCHAR(50),
	PRIMARY KEY (userName, postalZipcode),
	CONSTRAINT FK_ShippingAddress_webUser FOREIGN KEY (userName)  REFERENCES webUser(userName)
) ;

CREATE TABLE Shipment(
	shipmentID  int  NOT NULL,
	auctionID int NOT NULL,
	senderUserName    VARCHAR(30),
	reciverUserName      VARCHAR(30),
	PRIMARY KEY (shipmentID),
	CONSTRAINT FK_Shipment_Auction FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID)
) ;

CREATE TABLE Paypal(
	email  VARCHAR(50),
	passward   VARCHAR (50),
	buyerUserName  VARCHAR(30),
	billingAddress   VARCHAR(50),
	PRIMARY KEY (email,buyerUserName,billingAddress),	
	CONSTRAINT FK_Auction3_PaymentInfo3 FOREIGN KEY (billingAddress,buyerUserName)  REFERENCES  PaymentInfo(billingAddress,buyerUserName)
);

CREATE TABLE CreditCard(
	cardNumber   float  NOT NULL,
	expire  int  NOT NULL,
	securityCode   int  NOT NULL,
	billingAddress   VARCHAR(50),
	nameOnCard  VARCHAR(50),
	buyerUserName   VARCHAR(30),
	PRIMARY KEY (cardNumber,expire,securityCode,buyerUserName,billingAddress),
	CONSTRAINT FK_Auction2_PaymentInfo2 FOREIGN KEY (billingAddress,buyerUserName)  REFERENCES  PaymentInfo(billingAddress,buyerUserName)
);

CREATE TABLE Bitcoin(
	address   VARCHAR(30),
	quantity  DECIMAL(15,2),
	buyerUserName   VARCHAR(30),
	billingAddress   VARCHAR(50),
	PRIMARY KEY (address,buyerUserName,billingAddress),
	CONSTRAINT FK_Auction1_PaymentInfo1 FOREIGN KEY (billingAddress,buyerUserName)  REFERENCES  PaymentInfo(billingAddress,buyerUserName)
); 

INSERT INTO webUser VALUES ('JeffDaniels12', 'badpass','Jeff', 'Daniels', 'jeffyD@hotmail.com', '5556669201', '1972-02-05');
INSERT INTO webUser VALUES ('HelenfromHell', 'bp2212','Helen', 'Gregory', 'helenG@hotmail.com', '5546669301', '1992-01-04');
INSERT INTO webUser VALUES ('user1','password1','fname1','lname1','email1', 'phone1','1990-01-01');
INSERT INTO webUser VALUES ('user2','password2','fname2','lname2','email1','phone2','1990-01-01');
INSERT INTO webUser VALUES ('user3','password3','fname3','lname3','email1','phone3','1990-01-01');
INSERT INTO webUser VALUES ('user4','password4','fname4','lname4','email1','phone4','1990-01-01');
INSERT INTO webUser VALUES ('user55','password5','fname5','lname5','email1','phone5','1990-01-01');
INSERT INTO webUser (userName, password) VALUES ('admin','admin');
