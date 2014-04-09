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
    discountRate INTEGER(3),
    discountType VARCHAR(10),
    # lower and upper bound specify the range of values for monthly expenditure within which the given rate applies.
    lowerBound Integer(7),
    upperBound Integer(7),
    payLaterOption INTEGER(1),
    PRIMARY KEY (discountPlanID)
);

CREATE TABLE Customer(
    `alias` VARCHAR(20),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    title VARCHAR(10),
    # null, Regular, or Valued
    customerType VARCHAR(10),
    contactID INTEGER(10),
    discountPlanID INTEGER(10),
    PRIMARY KEY (`alias`),
    FOREIGN KEY (contactID) REFERENCES ContactDetails(contactID),
    FOREIGN KEY (discountPlanID) REFERENCES DiscountPlan(discountPlanID)
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
    commissionRate INTEGER(10),
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
    blankType VARCHAR(15),
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
    tax DECIMAL (10, 2),
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

-- INSERT queries
INSERT INTO Address(addressLine1, addressLine2, county, city, country, postCode) VALUES
    ("St Mary's Street 24", "Flat 79", "Middlesex", "London", "GB", "E34 2FG"),
    ("High Street", "BAS", "East Sussex", "Battle", "GB", "TN33 0AD"),
    ("Oxford Street", "Flat 61", "Westminster", "London", "GB", "W1W 8FJ"),
    ("Doctor Street", "Flat 1", "Greater London", "London", "GB", "E14 8FF"),
    ("Kingsland Road 149", "Flat 142", "Middlesex", "London", "GB", "E1 9FG");

INSERT INTO DiscountPlan (percentage, discountType, howAwarded, payLaterOption) VALUES
    (10, "Fixed", "Pay at end of month", 1),
    (15, "Flexible", "Deduct from future sales", 1),
    (0, null, null, 1),
    (0, null, null, 0);

INSERT INTO Customer VALUES
    (null, "Oregua", "Rakina", "Miss", "Valued", 1, 1),
    (null, "Jack", "Minchel", "Mr", "Regular", 2, 4),
    (null, "Michael", "Mandon", "Mr", "Regular", 3, 3);

INSERT INTO `User`(username, password, firstName, surname, `role`) VALUES
    ("addmein", MD5("Greedy"), "Glara", "McJanes", "Admin"),
    ("Jennifer", MD5("WestChance"), "Jennifer", "Alba", "Office Manager"),
    ("Sandy", MD5("PassMyWord"), "Sandy", "Alba", "Advisor");

INSERT INTO Commission(percentage, commissionType) VALUES
    (9, "Assessable"),
    (5, "Assessable");

INSERT INTO BlankType VALUES
    (201, "Domestic", 1);

INSERT INTO Blank VALUES
    ("20104277209", "Valid", 201, "Jennifer"),
    ("20158426790", "Valid", 201, "Jennifer"),
    ("20157257225", "Valid", 201, "Jennifer");

INSERT INTO Sale(price, currency, valueInUSD, `date`, `time`, paymentType, tax, customerID, username, blankID, commissionID, refunded) VALUES
    (30000, "BGL", 20, "2008-02-01", "18:32:02", "Cash", 5000, 1, "addmein", "20104277209", 1, 0),
    (40000, "BGL", 30, "2008-02-16", "11:32:49", "Credit Card", 5000, 2, "Jennifer", "20157257225", 1, 0),
    (50000, "BGL", 35, "2008-01-30", "14:41:25", "Cash", 5000, 1, "Sandy", "20158426790", 1, 1);

INSERT INTO Report(salesOfficePlace, periodStartDate, periodEndDate, `type`) VALUES
    ("Giday's Office", "2008-01-28", "2008-02-27", "Domestic Sales Report");

-- REPORT 1
-- INDIVIDUAL DOMESTIC SALES REPORT FOR USER ID 2
SELECT @rank:=@rank+1 AS "Number", Blank.blankID AS "Original Issued Number",
Sale.price AS "Fare Base", Sale.currency AS "Currency", Sale.valueInUSD AS "Fare Base (in USD)",
Sale.paymentType AS "Payment Form", Sale.tax AS "Taxes", Sale.price+Sale.tax AS "Total Amounts Paid",
Commission.percentage AS "Commission Rate", Sale.price*Commission.percentage/100 AS "Commission Amounts",
Commission.commissionType AS "Commission Type", "" AS "Other Details", "" AS "Notes"
FROM Blank, Sale, Commission, Report JOIN (SELECT @rank := 0) r WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 0 AND ReportID = 1 AND Sale.username = "Addmein" AND  Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Payment Amount by Payment Form (Part of the Individual Sales Report for user id 2)
SELECT Sale.paymentType AS "Payment Form", SUM(Sale.price+Sale.tax) AS "Total Amount Paid for a given Payment Form"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 0 AND Sale.username = "Jennifer" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Total Payment Amount for sales in a given period (Part of the Individual Sales Report for user id 2)
SELECT SUM(Sale.price+Sale.tax) AS "Total Amount Paid In a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 0 AND Sale.username = "Addmein" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Total Commissions per Commission Rate (Part of the Individual Sales Report for user id 2)
SELECT Commission.percentage AS "Commission Rate", SUM(Sale.price*Commission.percentage/100) AS "Total Commission Amounts For a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.Refunded = 0 AND ReportID = 1 AND Sale.username = "Addmein" AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Net Amounts For Agent Debit (Part of the Individual Sales Report for user id 2)
SELECT SUM(Sale.price-Sale.price*Commission.percentage/100) AS "Net Amounts For Agent Debit For a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 0 AND Sale.username = "Addmein" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- REPORT 2
-- INDIVIDUAL DOMESTIC REFUND REPORT FOR USER ID 2
SELECT @rank:=@rank+1 AS "Number", Blank.blankID AS "Original Issued Number",
Sale.price AS "Fare Base", Sale.currency AS "Currency", Sale.valueInUSD AS "Fare Base (in USD)",
Sale.paymentType AS "Payment Form", Sale.tax AS "Taxes", Sale.price+Sale.tax AS "Total Amounts Paid",
Commission.percentage AS "Commission Rate", Sale.price*Commission.percentage/100 AS "Commission Amounts",
Commission.commissionType AS "Commission Type", "" AS "Other Details", "" AS "Notes"
FROM Blank, Sale, Commission, Report JOIN (SELECT @rank := 0) r WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 1 AND ReportID = 1 AND Sale.username = "Addmein" AND  Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Payment Amount by Payment Form (Part of the Individual Refund Report for user id 2)
SELECT Sale.paymentType AS "Payment Form", SUM(Sale.price+Sale.tax) AS "Total Amount Paid for a given Payment Form"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 1 AND Sale.username = "Addmein" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Total Payment Amount (Part of the Individual Refund Report for user id 2)
SELECT SUM(Sale.price+Sale.tax) AS "Total Amount Paid In a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 1 AND Sale.username = "Addmein" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Total Commissions per Commission Rate (Part of the Individual Refund Report for user id 2)
SELECT Commission.percentage AS "Commission Rate", SUM(Sale.price*Commission.percentage/100) AS "Total Commission Amounts For a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.Refunded = 1 AND ReportID = 1 AND Sale.username = "Addmein" AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- Net Amounts For Agent Debit (Part of the Individual Refund Report for user id 2)
SELECT SUM(Sale.price-Sale.price*Commission.percentage/100) AS "Net Amounts For Agent Debit For a Report Period"
FROM Blank, Sale, Commission, Report WHERE Blank.blankID = Sale.blankID
AND Commission.commissionID = Sale.commissionID AND Sale.refunded = 1 AND Sale.username = "Addmein" AND ReportID = 1 AND Sale.`date` BETWEEN Report.periodStartDate AND Report.periodEndDate;

-- DELETE queries
DELETE FROM Sale WHERE saleID = 2;
DELETE FROM Blank WHERE blankID = "20157257225";

-- SELECT queries
SELECT * FROM Address;
SELECT firstName, surname, `role` FROM `User`;

-- UPDATE queries
UPDATE Address SET country = "United Kingdom" WHERE country = "GB";
UPDATE `User` SET `role` = "Admin" WHERE `username` = "Sandy";
