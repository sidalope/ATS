USE abpn980;

SET storage_engine=INNODB;

DROP TABLE IF EXISTS Sale_Report;
DROP TABLE IF EXISTS Report;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Blank;
DROP TABLE IF EXISTS BlankType;
DROP TABLE IF EXISTS Commission;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS DiscountPlan;
DROP TABLE IF EXISTS Address;

CREATE TABLE Address(
    addressID INTEGER(10) AUTO_INCREMENT, 
    addressLine1 VARCHAR(50), 
    addressLine2 VARCHAR(50), 
    county VARCHAR(50), 
    city VARCHAR(50), 
    country VARCHAR(50), 
    postCode VARCHAR(8),
    PRIMARY KEY (addressID)
);


CREATE TABLE DiscountPlan(
    discountPlanID INTEGER(10) AUTO_INCREMENT,
    percentage DECIMAL(10, 2),
    discountType VARCHAR(10),
    howAwarded VARCHAR(50),
    payLaterOption INTEGER(1),
    PRIMARY KEY (discountPlanID)
);

CREATE TABLE Customer(
    customerID INTEGER(5) AUTO_INCREMENT,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    title VARCHAR(10),
    `type` VARCHAR(10),
    addressID INTEGER(10),
    discountPlanID INTEGER(10),
    PRIMARY KEY (customerID),
    FOREIGN KEY (addressID) REFERENCES Address(addressID),
    FOREIGN KEY (discountPlanID) REFERENCES DiscountPlan(discountPlanID)
);

CREATE TABLE `User`(
    username VARCHAR(20),
    password VARCHAR(20),
    firstName VARCHAR(20),
    surname VARCHAR(20),
    `role` VARCHAR(20),
    PRIMARY KEY (username)
);
	
CREATE TABLE Commission(
    commissionID INTEGER(10) AUTO_INCREMENT,
    percentage DECIMAL(10, 2),
    commissionType VARCHAR(10),
    PRIMARY KEY (commissionID)
);
	
CREATE TABLE BlankType(
    blankTypeID VARCHAR(3),
    blankType VARCHAR(10),
    numberOfCoupons INTEGER(10),
    PRIMARY KEY (blankTypeID)
);
	
CREATE TABLE Blank(
    blankID VARCHAR(11),
    blankStatus VARCHAR(20),
    blankTypeID VARCHAR(3),
    username VARCHAR(20),
    PRIMARY KEY (blankID),
    FOREIGN KEY (blankTypeID) REFERENCES BlankType(blankTypeID),
    FOREIGN KEY (username) REFERENCES `User`(username)
);

CREATE TABLE Sale(
    saleID INTEGER(10) AUTO_INCREMENT,
    price DECIMAL(10, 2),
    currency VARCHAR(20),
    valueInUSD DECIMAL(10, 2),
    `date` DATE,
    `time` TIME,
    paymentType VARCHAR(10),
    tax DECIMAL (10, 2),
    customerID INTEGER(10),
    username VARCHAR(20),
    blankID VARCHAR(11),
    commissionID INTEGER(10),
    refunded BIT,
    PRIMARY KEY (saleID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    FOREIGN KEY (username) REFERENCES `User`(username),
    FOREIGN KEY (blankID) REFERENCES Blank(blankID),
    FOREIGN KEY (commissionID) REFERENCES Commission(commissionID)
);
	
CREATE TABLE Report(
    reportID INTEGER(10) AUTO_INCREMENT,
    salesOfficePlace VARCHAR(50),
    periodStartDate DATE,
    periodEndDate DATE,
    `type` VARCHAR(50),
    PRIMARY KEY (reportID)
);

CREATE TABLE Sale_Report(
    sale_reportID INTEGER(10) AUTO_INCREMENT,
    saleID INTEGER(10),
    reportID INTEGER(10),
    PRIMARY KEY (sale_reportID),
    FOREIGN KEY (saleID) REFERENCES Sale(saleID),
    FOREIGN KEY (reportID) REFERENCES Report(reportID)
);
