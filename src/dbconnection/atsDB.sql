USE abpn980;

SET storage_engine=INNODB;

DROP TABLE IF EXISTS Sale_Report;
DROP TABLE IF EXISTS Report;
DROP TABLE IF EXISTS Refund;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Blank;
DROP TABLE IF EXISTS BlankType;
DROP TABLE IF EXISTS Commission;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS DiscountPlan;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS ContactDetails;


CREATE TABLE ContactDetails(
    contactID INTEGER(10) AUTO_INCREMENT, 
    addressLine1 VARCHAR(50), 
    addressLine2 VARCHAR(50), 
    county VARCHAR(50), 
    city VARCHAR(50), 
    country VARCHAR(50), 
    postCode VARCHAR(8),
    phoneNumber VARCHAR(15),
    PRIMARY KEY (contactID)
);


CREATE TABLE DiscountPlan(
    discountPlanID INTEGER(10) AUTO_INCREMENT,
    customerAlias VARCHAR(20),
    discountRate INTEGER(3),
    discountType VARCHAR(10),
    # lower and upper bound specify the range of values for monthly expenditure within which the given rate applies.
    lowerBound Integer(7),
    upperBound Integer(7),
    PRIMARY KEY (discountPlanID)
);

# Adding alias as a foreign key doesn't work if re-CREATEing the whole db, and must be done separately
# ALTER TABLE DiscountPlan ADD FOREIGN KEY (`alias`) REFERENCES Customer(`alias`)

CREATE TABLE Customer(
    `alias` VARCHAR(20),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    # null, Regular, or Valued
    customerType VARCHAR(10),
    contactID INTEGER(10),
    PRIMARY KEY (`alias`),
    FOREIGN KEY (contactID) REFERENCES ContactDetails(contactID),
    FOREIGN KEY (`alias`) REFERENCES DiscountPlan(customerAlias)
);

CREATE TABLE `User`(
    userID INTEGER(3),
    password VARCHAR(20),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    `role` VARCHAR(20),
    PRIMARY KEY (userID)
);
	
CREATE TABLE Commission(
    commissionRate DECIMAL(3,2),
    dateAdded DATE,
    # by searching where dateRetired = null one can find all occurrances of commissionRates in use
    dateRetired DATE,
    # what is commissionType meant to be?
    # commissionType VARCHAR(10),
    PRIMARY KEY (commissionRate)
);

CREATE TABLE BlankType (
    # add a CHECK constraint
    blankCode INTEGER(3),
    blankType VARCHAR(30),
    PRIMARY KEY (blankCode)
);
	
# CREATE TABLE BlankType(
  #   blankTypeID VARCHAR(3),
  #  blankType VARCHAR(10),
  #  numberOfCoupons INTEGER(10),
  #  PRIMARY KEY (blankTypeID)
# );
	
CREATE TABLE Blank(
    blankID VARCHAR(11),
    blankStatus VARCHAR(20),
    blankCode INTEGER(3),
    userID INTEGER(3),
    dateAdded DATE,
    dateAssigned DATE,
    PRIMARY KEY (blankID),
    FOREIGN KEY (blankCode) REFERENCES BlankType(blankCode),
    FOREIGN KEY (userID) REFERENCES `User`(userID)
);

CREATE TABLE Sale(
    saleID INTEGER(10) AUTO_INCREMENT,
    usdConversionFactor DECIMAL(10, 3),
    userID INTEGER(3),
    fareInLocalCurrency DECIMAL(10, 2),
    taxesLocal DECIMAL (10, 2),
    taxesOther DECIMAL (10, 2),
    currency VARCHAR(20),
    `date` DATE,
    `time` TIME,
    paymentID VARCHAR(10),
    `alias` VARCHAR(20),    
    blankID VARCHAR(11),
    commissionRate INTEGER(10),
    PRIMARY KEY (saleID),
    FOREIGN KEY (`alias`) REFERENCES Customer(`alias`),
    FOREIGN KEY (userID) REFERENCES `User`(userID),
    FOREIGN KEY (blankID) REFERENCES Blank(blankID),
    FOREIGN KEY (commissionRate) REFERENCES Commission(commissionRate)
);

CREATE TABLE Payment (
    paymentID INTEGER(10) AUTO_INCREMENT,
    transactionType VARCHAR(4),
    confirmed BIT,
    cardType VARCHAR(20),
    cardNumber Integer(22),
    dateDue DATE,
    dateReceived DATE,
    remindersSent INTEGER(2),
    PRIMARY KEY (paymentID)
);
	
CREATE TABLE Refund (
    refundID INTEGER(10),
    saleID INTEGER(10),
    # defines whether the refund was made in full, or what amount of the original sum was refunded
    refundedPortion VARCHAR (10),
    PRIMARY KEY (refundID),
    FOREIGN KEY (saleID) REFERENCES Sale(saleID)
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


# Adding alias as a foreign key doesn't work if re-CREATEing the whole db, and must be done separately
# ALTER TABLE DiscountPlan ADD FOREIGN KEY (`alias`) REFERENCES Customer(`alias`)