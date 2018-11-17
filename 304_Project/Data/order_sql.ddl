CREATE TABLE User(
	userName  VARCHAR(30)    NOT  NULL,
	password     VARCHAR(20),
	firstName   VARCHAR(30),
	lastName    VARCHAR(30),
	email      VARCHAR(50),
	phonenum  VARCHAR(12),
	birthdate  DATE,
	PRIMARY KEY (userName)
)

CREATE TABLE PaymentInfo(
	billingAddress   VARCHAR(50) NOT  NULL,
	buyerUserName  VARCHAR(30)    NOT  NULL,
	PRIMARY KEY (billingAddress,buyerUserName),
	FOREIGN KEY (buyerUserName)  REFERENCES  User(userName) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE Auction(
	auctionID INTEGER NOT NULL,
	billingAddress   VARCHAR(50),
	buyerUserName  VARCHAR(30),
	startDate  DATETIME,
	endDate  DATETIME,
	highestBid   DOUBLE,
	sellerUserName  VARCHAR(30),
	PRIMARY KEY (auctionID),
	FOREIGN KEY (sellerUserName)  REFERENCES  User(userName) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (billingAddress)  REFERENCES  PaymentInfo(billingAddress) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (buyerUserName)  REFERENCES  User(userName) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE Company(
	invioceID     INTEGER  NOT NULL,
	auctionID   INTEGER,
	auctionFee     DOUBLE,
	PRIMARY KEY (invioceID),
	FOREIGN KEY (auctionID)  REFERENCES Auction(auctionID) ON DELETE SET NULL ON UPDATE CASCADE
	)

CREATE TABLE Book (
	ISBN   VARCHAR(50)       NOT NULL,
	auctionID   INTEGER      NOT NULL,
	title  VARCHAR(30),
	sellerUserName  VARCHAR(30)  NOT NULL,
	subject     VARCHAR(30),
	author   VARCHAR(30),
	edition    INTEGER,
	quality     INTEGER,
	startPrice   DECIMAL(15,2),
	description  VARCHAR(150),
	PRIMARY KEY (auctionID,sellerUserName,ISBN),
	FOREIGN KEY (auctionID)  REFERENCES Auction(auctionID) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (sellerUserName)  REFERENCES User(userName) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE Paypal(
	email  VARCHAR(50),
	passward   VARCHAR (50),
	buyerUserName  VARCHAR(30),
	billingAddress   VARCHAR(50),
	PRIMARY KEY (email,buyerUserName,billingAddress),	
	FOREIGN KEY (buyerUserName)  REFERENCES  PaymentInfo(buyerUserName) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (billingAddress)  REFERENCES  PaymentInfo(billingAddress) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE Complaint(
	complaintID  INTEGER NOT NULL,
	auctionID   INTEGER ,
	sellerUserName  VARCHAR(30),
	buyerUserName VARCHAR(30),
	description   VARCHAR(150),
	dateSubmitted   DATE,
	PRIMARY KEY (complaintID),
	FOREIGN KEY (sellerUserName)  REFERENCES  Auction(sellerUserName) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (buyerUserName)  REFERENCES  Auction(buyerUserName) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Bids(
	auctionID   INTEGER  NOT NULL,
	buyerUserName VARCHAR(30)  NOT NULL,
	bidAmount  DOUBLE,
	dates   DATETIME,
	PRIMARY KEY (buyerUserName,auctionid),
	FOREIGN KEY (buyerUserName)  REFERENCES  User(userName) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE ShippingAddress(
	userName  VARCHAR(30),
	postalZipcode     VARCHAR(10),
	street    VARCHAR(50),
	city  VARCHAR(30),
	provinceState    VARCHAR(50),
	country   VARCHAR(50),
	PRIMARY KEY (userName, postalZipcode),
	FOREIGN KEY (userName)  REFERENCES User(userName) ON DELETE NO action ON UPDATE CASCADE
) 

CREATE TABLE Shipment(
	shipmentID  INTEGER  NOT NULL,
	auctionID INTEGER  NOT NULL,
	senderUserName    VARCHAR(30),
	recipientUserName      VARCHAR(30),
	PRIMARY KEY (shipmentID),
	FOREIGN KEY (auctionID)  REFERENCES  Auction(auctionID) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (recipientUserName)  REFERENCES  ShippingAddress(userName) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (senderUserName)  REFERENCES  ShippingAddress(userName) ON DELETE NO action ON UPDATE CASCADE
) 

CREATE TABLE CreditCard(
	cardNumber   FLOAT  NOT NULL,
	expiry  INTEGER  NOT NULL,
	securityCode   INTEGER NOT NULL,
	billingAddress   VARCHAR(50),
	nameOnCard  VARCHAR(50),
	buyerUserName   VARCHAR(50),
	PRIMARY KEY (cardNumber,expire,securityCode,buyerUserName,billingAddress),
	FOREIGN KEY (buyerUserName)  REFERENCES  PaymentInfo(buyerUserName) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (billingAddress)  REFERENCES  PaymentInfo(billingAddress) ON DELETE NO action ON UPDATE CASCADE
)

CREATE TABLE Bitcoin(
	address   VARCHAR(30),
	quantity  DECIMAL(15,2),
	buyeruserName   VARCHAR(30),
	billingAddress   VARCHAR(50),
	PRIMARY KEY (address,buyerUserName,billingAddress),
	FOREIGN KEY (buyerUserName)  REFERENCES  PaymentInfo(buyerUserName) ON DELETE NO action ON UPDATE CASCADE,
	FOREIGN KEY (billingAddress)  REFERENCES  PaymentInfo(billingAddress) ON DELETE NO action ON UPDATE CASCADE
) 

INSERT INTO User VALUES ('JeffDaniels12', 'badpass','Jeff', 'Daniels', 'jeffyD@hotmail.com', '5556669201', '1972-02-05');
INSERT INTO User VALUES ('HelenfromHell', 'bp2212','Helen', 'Gregory', 'helenG@hotmail.com', '5546669301', '1992-01-04');
