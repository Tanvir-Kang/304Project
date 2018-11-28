ALTER TABLE Auction DROP CONSTRAINT FK_Auction_webUser;
ALTER TABLE Auction DROP CONSTRAINT FK_Auction_PaymentInfo;
ALTER TABLE Auction DROP CONSTRAINT FK_Auction_Company;
ALTER TABLE savedAuctions DROP CONSTRAINT FK_savedAuctions_User;
ALTER TABLE savedAuctions DROP CONSTRAINT FK_savedAuctions_Auction;
ALTER TABLE PaymentInfo DROP CONSTRAINT FK_PaymentInfo_webUser;
ALTER TABLE ProductImage DROP CONSTRAINT FK_Photo_Auction;

DROP TABLE Book;
DROP TABLE Complaint;
DROP TABLE Bids;
DROP TABLE ShippingAddress;
DROP TABLE Shipment;
DROP TABLE CreditCard;
DROP TABLE Paypal;
DROP TABLE Bitcoin;
DROP TABLE Company;
DROP TABLE PaymentInfo;
DROP TABLE webUser;
DROP TABLE savedAuctions;
DROP TABLE Auction;
DROP TABLE productImage;

CREATE TABLE ProductImage (
	photoID	int NOT NULL, 
	path	varchar(255)
	PRIMARY KEY (photoID),
	CONSTRAINT FK_Photo_Auction FOREIGN KEY (photoID)  REFERENCES Auction(auctionID),
	
);

CREATE TABLE webUser(
	userName  VARCHAR(30)   NOT  NULL,
	password     VARCHAR(20)   NOT NULL,
	firstName   VARCHAR(30)   NOT NULL,
	lastName    VARCHAR(30)   NOT NULL,
	email      VARCHAR(50)   NOT NULL,
	phonenum  VARCHAR(12),
	birthdate  DATE,
	admin	BIT NOT NULL,
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
	auctionID int NOT NULL IDENTITY,
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

CREATE TABLE Book(
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
	image	varbinary(MAX),
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
CREATE TABLE savedAuctions(
	auctionID   int  NOT NULL,
	buyerUserName VARCHAR(30)  NOT NULL,
	PRIMARY KEY (buyerUserName,auctionID),
	CONSTRAINT FK_savedAuctions_User FOREIGN KEY (buyerUserName)  REFERENCES  webUser(userName),
	CONSTRAINT FK_savedAuctions_Auction FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID)
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

INSERT INTO webUser VALUES ('JeffDaniels12', 'badpass','Jeff', 'Daniels', 'jeffyD@hotmail.com', '5556669201', '1972-02-05', '0');
INSERT INTO webUser VALUES ('HelenfromHell', 'bp2212','Helen', 'Gregory', 'helenG@hotmail.com', '5546669301', '1992-01-04', '0');
INSERT INTO webUser VALUES ('user1','password1','fname1','lname1','email1', 'phone1','1990-01-01', '0');
INSERT INTO webUser VALUES ('user2','password2','fname2','lname2','email1','phone2','1990-01-01', '0');
INSERT INTO webUser VALUES ('user3','password3','fname3','lname3','email1','phone3','1990-01-01', '0');
INSERT INTO webUser VALUES ('user4','password4','fname4','lname4','email1','phone4','1990-01-01', '0');
INSERT INTO webUser VALUES ('admin','adminpass','fname5','lname5','email1','phone5','1990-01-01', '1');

INSERT INTO ShippingAddress VALUES ('HelenfromHell', 'postal', 'street', 'city', 'bc', 'canada');
INSERT INTO ShippingAddress VALUES ('JeffDaniels12', 'postal', 'street', 'city', 'bc', 'canada');

INSERT INTO Company VALUES (1,'70.05');
INSERT INTO Company VALUES (2,'10.05');
INSERT INTO Company VALUES (3,'90.05');

INSERT INTO PaymentInfo VALUES ('HelenfromHell','billingaddress');
INSERT INTO PaymentInfo VALUES ('JeffDaniels12','billingaddress2');

INSERT INTO Paypal VALUES ('helenG@hotmail.com','paypalpw','HelenfromHell','billingaddress');
INSERT INTO Paypal VALUES ('jeffyD@hotmail.com','paypalpw','JeffDaniels12','billingaddress2');

DECLARE @auctionID int
INSERT INTO Auction  VALUES ('billingaddress',NULL,NULL,'700.50','JeffDaniels12','HelenfromHell',1)
SELECT @auctionID = @@IDENTITY
INSERT INTO Book VALUES ('145678578543456',@auctionID,'Computer Science','JeffDaniels12','Computer Science','John',8,4,110.99,NULL, NULL);

DECLARE @auctionID int
INSERT INTO Auction VALUES ('billingaddress2',NULL,NULL,'100.50','HelenfromHell','JeffDaniels12',2)
SELECT @auctionID = @@IDENTITY
INSERT INTO Book VALUES ('987345984780100',@auctionID,'Biology','JeffDaniels12','Computer Science','John',8,4,110.99,NULL, NULL);

DECLARE @auctionID int
INSERT INTO Auction VALUES ('billingaddress2',NULL,NULL,'300.50','HelenfromHell','JeffDaniels12',3)
SELECT @auctionID = @@IDENTITY
INSERT INTO Book VALUES ('145678578543456',@auctionID,'Computer Science','JeffDaniels12','Computer Science','John',8,4,110.99,NULL, NULL);
