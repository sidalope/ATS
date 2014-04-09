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

INSERT INTO ContactDetails(contactID, addressLine1, addressLine2, county, city, country, postCode, phoneNumber) VALUES
("1", "St Mary's Street 24", "Flat 79", "Middlesex", "London", "GB", "E34 2FG", 07983667934),
("2", "High Street", "BAS", "East Sussex", "Battle", "GB", "TN33 0AD", 07986447267),
("3", "Oxford Street", "Flat 61", "Westminster", "London", "GB", "W1W 8FJ", 07985439877),
("4", "Doctor Street", "Flat 1", "Greater London", "London", "GB", "E14 8FF", 07985662881),
("5", "Kingsland Road 149", "Flat 142", "Middlesex", "London", "GB", "E1 9FG", 07985543370);





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

INSERT INTO DiscountPlan(discountPlanID, customerAlias, discountRate, discountType, lowerBound, upperBound) VALUES
(1, "Chris", 1, "Fixed", NULL, NULL),
(2, "DaveD", 1, "Flexible", 1000, 2000),
(3, "DaveD", 2, "Flexible", 2000, NULL),
(4, "SarahB", 2, "Fixed", NULL, NULL);





CREATE TABLE Customer(
    customerAlias VARCHAR(20),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    customerType VARCHAR(10),
    contactID INTEGER(10),
    PRIMARY KEY (customerAlias),
    FOREIGN KEY (contactID) REFERENCES ContactDetails(contactID),
    FOREIGN KEY (customerAlias) REFERENCES DiscountPlan(customerAlias)
);

INSERT INTO Customer(customerAlias, firstName, lastName, customerType, contactID) VALUES
("Chris", "Chris", "Smart", "Valued", 1),
("DaveD", "Dave", "Dodson", "Valued", 2),
("SarahB", "Sarah", "Broklehurst", "Valued", 3);






CREATE TABLE `User`(
    userID INTEGER(3),
    password VARCHAR(20),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    `role` VARCHAR(20),
    PRIMARY KEY (userID)
);

INSERT INTO `User`(userID, password, firstName, lastName, `role`) VALUES
(250, "PinkMobile", "Penelope", "Pitstop", "Travel Advisor"),
(211, "Gnasher", "Dennis", "Menace", "Travel Advisor"),
(220, "NotiGirl", "Minnie", "Minx", "Manager"),
(320, "LiesaLot", "Arthur", "Daley", "Administrator");







CREATE TABLE Commission(
    commissionRate DECIMAL(3,2),
    dateAdded DATE,
    # by searching where dateRetired = null one can find all occurrances of commissionRates in use
    dateRetired DATE,
    # what is commissionType meant to be?
    # commissionType VARCHAR(10),
    PRIMARY KEY (commissionRate)
);

INSERT INTO Commission(commissionRate, dateAdded, dateRetired) VALUES
(5.5, 2012-01-01, NULL),
(9.0, 2012-02-02, NULL),
(5.0, 2012-03-03, NULL),
(7.0, 2012-04-04, NULL);







CREATE TABLE BlankType (
    # add a CHECK constraint
    blankCode INTEGER(3),
    blankType VARCHAR(30),
    PRIMARY KEY (blankCode)
);

INSERT INTO BlankType(blankCode, blankType) VALUES
(444, "Int. Auto. 4 Coupons"),
(440, "Int. Man. 4 Coupons"),
(420, "Int. Man. 2 Coupons"),
(201, "Dom. Man. 2 Coupons"),
(101, "Dom. Man. 1 Coupon"),
(451, "Excess Luggage"),
(452, "Miscellaneous");



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

INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES (44400000001, NULL, 444, NULL, 2013-04-01, NULL), (44400000002, NULL, 444, NULL, 2013-04-01, NULL), (44400000003, NULL, 444, NULL, 2013-04-01, NULL), (44400000004, NULL, 444, NULL, 2013-04-01, NULL), (44400000005, NULL, 444, NULL, 2013-04-01, NULL), (44400000006, NULL, 444, NULL, 2013-04-01, NULL), (44400000007, NULL, 444, NULL, 2013-04-01, NULL), (44400000008, NULL, 444, NULL, 2013-04-01, NULL), (44400000009, NULL, 444, NULL, 2013-04-01, NULL), (44400000010, NULL, 444, NULL, 2013-04-01, NULL), (44400000011, NULL, 444, NULL, 2013-04-01, NULL), (44400000012, NULL, 444, NULL, 2013-04-01, NULL), (44400000013, NULL, 444, NULL, 2013-04-01, NULL), (44400000014, NULL, 444, NULL, 2013-04-01, NULL), (44400000015, NULL, 444, NULL, 2013-04-01, NULL), (44400000016, NULL, 444, NULL, 2013-04-01, NULL), (44400000017, NULL, 444, NULL, 2013-04-01, NULL), (44400000018, NULL, 444, NULL, 2013-04-01, NULL), (44400000019, NULL, 444, NULL, 2013-04-01, NULL), (44400000020, NULL, 444, NULL, 2013-04-01, NULL), (44400000021, NULL, 444, NULL, 2013-04-01, NULL), (44400000022, NULL, 444, NULL, 2013-04-01, NULL), (44400000023, NULL, 444, NULL, 2013-04-01, NULL), (44400000024, NULL, 444, NULL, 2013-04-01, NULL), (44400000025, NULL, 444, NULL, 2013-04-01, NULL), (44400000026, NULL, 444, NULL, 2013-04-01, NULL), (44400000027, NULL, 444, NULL, 2013-04-01, NULL), (44400000028, NULL, 444, NULL, 2013-04-01, NULL), (44400000029, NULL, 444, NULL, 2013-04-01, NULL), (44400000030, NULL, 444, NULL, 2013-04-01, NULL), (44400000031, NULL, 444, NULL, 2013-04-01, NULL), (44400000032, NULL, 444, NULL, 2013-04-01, NULL), (44400000033, NULL, 444, NULL, 2013-04-01, NULL), (44400000034, NULL, 444, NULL, 2013-04-01, NULL), (44400000035, NULL, 444, NULL, 2013-04-01, NULL), (44400000036, NULL, 444, NULL, 2013-04-01, NULL), (44400000037, NULL, 444, NULL, 2013-04-01, NULL), (44400000038, NULL, 444, NULL, 2013-04-01, NULL), (44400000039, NULL, 444, NULL, 2013-04-01, NULL), (44400000040, NULL, 444, NULL, 2013-04-01, NULL), (44400000041, NULL, 444, NULL, 2013-04-01, NULL), (44400000042, NULL, 444, NULL, 2013-04-01, NULL), (44400000043, NULL, 444, NULL, 2013-04-01, NULL), (44400000044, NULL, 444, NULL, 2013-04-01, NULL), (44400000045, NULL, 444, NULL, 2013-04-01, NULL), (44400000046, NULL, 444, NULL, 2013-04-01, NULL), (44400000047, NULL, 444, NULL, 2013-04-01, NULL), (44400000048, NULL, 444, NULL, 2013-04-01, NULL), (44400000049, NULL, 444, NULL, 2013-04-01, NULL), (44400000050, NULL, 444, NULL, 2013-04-01, NULL), (44400000051, NULL, 444, NULL, 2013-04-01, NULL), (44400000052, NULL, 444, NULL, 2013-04-01, NULL), (44400000053, NULL, 444, NULL, 2013-04-01, NULL), (44400000054, NULL, 444, NULL, 2013-04-01, NULL), (44400000055, NULL, 444, NULL, 2013-04-01, NULL), (44400000056, NULL, 444, NULL, 2013-04-01, NULL), (44400000057, NULL, 444, NULL, 2013-04-01, NULL), (44400000058, NULL, 444, NULL, 2013-04-01, NULL), (44400000059, NULL, 444, NULL, 2013-04-01, NULL), (44400000060, NULL, 444, NULL, 2013-04-01, NULL), (44400000061, NULL, 444, NULL, 2013-04-01, NULL), (44400000062, NULL, 444, NULL, 2013-04-01, NULL), (44400000063, NULL, 444, NULL, 2013-04-01, NULL), (44400000064, NULL, 444, NULL, 2013-04-01, NULL), (44400000065, NULL, 444, NULL, 2013-04-01, NULL), (44400000066, NULL, 444, NULL, 2013-04-01, NULL), (44400000067, NULL, 444, NULL, 2013-04-01, NULL), (44400000068, NULL, 444, NULL, 2013-04-01, NULL), (44400000069, NULL, 444, NULL, 2013-04-01, NULL), (44400000070, NULL, 444, NULL, 2013-04-01, NULL), (44400000071, NULL, 444, NULL, 2013-04-01, NULL), (44400000072, NULL, 444, NULL, 2013-04-01, NULL), (44400000073, NULL, 444, NULL, 2013-04-01, NULL), (44400000074, NULL, 444, NULL, 2013-04-01, NULL), (44400000075, NULL, 444, NULL, 2013-04-01, NULL), (44400000076, NULL, 444, NULL, 2013-04-01, NULL), (44400000077, NULL, 444, NULL, 2013-04-01, NULL), (44400000078, NULL, 444, NULL, 2013-04-01, NULL), (44400000079, NULL, 444, NULL, 2013-04-01, NULL), (44400000080, NULL, 444, NULL, 2013-04-01, NULL), (44400000081, NULL, 444, NULL, 2013-04-01, NULL), (44400000082, NULL, 444, NULL, 2013-04-01, NULL), (44400000083, NULL, 444, NULL, 2013-04-01, NULL), (44400000084, NULL, 444, NULL, 2013-04-01, NULL), (44400000085, NULL, 444, NULL, 2013-04-01, NULL), (44400000086, NULL, 444, NULL, 2013-04-01, NULL), (44400000087, NULL, 444, NULL, 2013-04-01, NULL), (44400000088, NULL, 444, NULL, 2013-04-01, NULL), (44400000089, NULL, 444, NULL, 2013-04-01, NULL), (44400000090, NULL, 444, NULL, 2013-04-01, NULL), (44400000091, NULL, 444, NULL, 2013-04-01, NULL), (44400000092, NULL, 444, NULL, 2013-04-01, NULL), (44400000093, NULL, 444, NULL, 2013-04-01, NULL), (44400000094, NULL, 444, NULL, 2013-04-01, NULL), (44400000095, NULL, 444, NULL, 2013-04-01, NULL), (44400000096, NULL, 444, NULL, 2013-04-01, NULL), (44400000097, NULL, 444, NULL, 2013-04-01, NULL), (44400000098, NULL, 444, NULL, 2013-04-01, NULL), (44400000099, NULL, 444, NULL, 2013-04-01, NULL), (44400000100, NULL, 444, NULL, 2013-04-01, NULL);

INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES (42000000001, NULL, 420, NULL, 2013-05-08, NULL), (42000000002, NULL, 420, NULL, 2013-05-08, NULL), (42000000003, NULL, 420, NULL, 2013-05-08, NULL), (42000000004, NULL, 420, NULL, 2013-05-08, NULL), (42000000005, NULL, 420, NULL, 2013-05-08, NULL), (42000000006, NULL, 420, NULL, 2013-05-08, NULL), (42000000007, NULL, 420, NULL, 2013-05-08, NULL), (42000000008, NULL, 420, NULL, 2013-05-08, NULL), (42000000009, NULL, 420, NULL, 2013-05-08, NULL), (42000000010, NULL, 420, NULL, 2013-05-08, NULL), (42000000011, NULL, 420, NULL, 2013-05-08, NULL), (42000000012, NULL, 420, NULL, 2013-05-08, NULL), (42000000013, NULL, 420, NULL, 2013-05-08, NULL), (42000000014, NULL, 420, NULL, 2013-05-08, NULL), (42000000015, NULL, 420, NULL, 2013-05-08, NULL), (42000000016, NULL, 420, NULL, 2013-05-08, NULL), (42000000017, NULL, 420, NULL, 2013-05-08, NULL), (42000000018, NULL, 420, NULL, 2013-05-08, NULL), (42000000019, NULL, 420, NULL, 2013-05-08, NULL), (42000000020, NULL, 420, NULL, 2013-05-08, NULL), (42000000021, NULL, 420, NULL, 2013-05-08, NULL), (42000000022, NULL, 420, NULL, 2013-05-08, NULL), (42000000023, NULL, 420, NULL, 2013-05-08, NULL), (42000000024, NULL, 420, NULL, 2013-05-08, NULL), (42000000025, NULL, 420, NULL, 2013-05-08, NULL), (42000000026, NULL, 420, NULL, 2013-05-08, NULL), (42000000027, NULL, 420, NULL, 2013-05-08, NULL), (42000000028, NULL, 420, NULL, 2013-05-08, NULL), (42000000029, NULL, 420, NULL, 2013-05-08, NULL), (42000000030, NULL, 420, NULL, 2013-05-08, NULL), (42000000031, NULL, 420, NULL, 2013-05-08, NULL), (42000000032, NULL, 420, NULL, 2013-05-08, NULL), (42000000033, NULL, 420, NULL, 2013-05-08, NULL), (42000000034, NULL, 420, NULL, 2013-05-08, NULL), (42000000035, NULL, 420, NULL, 2013-05-08, NULL), (42000000036, NULL, 420, NULL, 2013-05-08, NULL), (42000000037, NULL, 420, NULL, 2013-05-08, NULL), (42000000038, NULL, 420, NULL, 2013-05-08, NULL), (42000000039, NULL, 420, NULL, 2013-05-08, NULL), (42000000040, NULL, 420, NULL, 2013-05-08, NULL), (42000000041, NULL, 420, NULL, 2013-05-08, NULL), (42000000042, NULL, 420, NULL, 2013-05-08, NULL), (42000000043, NULL, 420, NULL, 2013-05-08, NULL), (42000000044, NULL, 420, NULL, 2013-05-08, NULL), (42000000045, NULL, 420, NULL, 2013-05-08, NULL), (42000000046, NULL, 420, NULL, 2013-05-08, NULL), (42000000047, NULL, 420, NULL, 2013-05-08, NULL), (42000000048, NULL, 420, NULL, 2013-05-08, NULL), (42000000049, NULL, 420, NULL, 2013-05-08, NULL), (42000000050, NULL, 420, NULL, 2013-05-08, NULL), (42000000051, NULL, 420, NULL, 2013-05-08, NULL), (42000000052, NULL, 420, NULL, 2013-05-08, NULL), (42000000053, NULL, 420, NULL, 2013-05-08, NULL), (42000000054, NULL, 420, NULL, 2013-05-08, NULL), (42000000055, NULL, 420, NULL, 2013-05-08, NULL), (42000000056, NULL, 420, NULL, 2013-05-08, NULL), (42000000057, NULL, 420, NULL, 2013-05-08, NULL), (42000000058, NULL, 420, NULL, 2013-05-08, NULL), (42000000059, NULL, 420, NULL, 2013-05-08, NULL), (42000000060, NULL, 420, NULL, 2013-05-08, NULL), (42000000061, NULL, 420, NULL, 2013-05-08, NULL), (42000000062, NULL, 420, NULL, 2013-05-08, NULL), (42000000063, NULL, 420, NULL, 2013-05-08, NULL), (42000000064, NULL, 420, NULL, 2013-05-08, NULL), (42000000065, NULL, 420, NULL, 2013-05-08, NULL), (42000000066, NULL, 420, NULL, 2013-05-08, NULL), (42000000067, NULL, 420, NULL, 2013-05-08, NULL), (42000000068, NULL, 420, NULL, 2013-05-08, NULL), (42000000069, NULL, 420, NULL, 2013-05-08, NULL), (42000000070, NULL, 420, NULL, 2013-05-08, NULL), (42000000071, NULL, 420, NULL, 2013-05-08, NULL), (42000000072, NULL, 420, NULL, 2013-05-08, NULL), (42000000073, NULL, 420, NULL, 2013-05-08, NULL), (42000000074, NULL, 420, NULL, 2013-05-08, NULL), (42000000075, NULL, 420, NULL, 2013-05-08, NULL), (42000000076, NULL, 420, NULL, 2013-05-08, NULL), (42000000077, NULL, 420, NULL, 2013-05-08, NULL), (42000000078, NULL, 420, NULL, 2013-05-08, NULL), (42000000079, NULL, 420, NULL, 2013-05-08, NULL), (42000000080, NULL, 420, NULL, 2013-05-08, NULL), (42000000081, NULL, 420, NULL, 2013-05-08, NULL), (42000000082, NULL, 420, NULL, 2013-05-08, NULL), (42000000083, NULL, 420, NULL, 2013-05-08, NULL), (42000000084, NULL, 420, NULL, 2013-05-08, NULL), (42000000085, NULL, 420, NULL, 2013-05-08, NULL), (42000000086, NULL, 420, NULL, 2013-05-08, NULL), (42000000087, NULL, 420, NULL, 2013-05-08, NULL), (42000000088, NULL, 420, NULL, 2013-05-08, NULL), (42000000089, NULL, 420, NULL, 2013-05-08, NULL), (42000000090, NULL, 420, NULL, 2013-05-08, NULL), (42000000091, NULL, 420, NULL, 2013-05-08, NULL), (42000000092, NULL, 420, NULL, 2013-05-08, NULL), (42000000093, NULL, 420, NULL, 2013-05-08, NULL), (42000000094, NULL, 420, NULL, 2013-05-08, NULL), (42000000095, NULL, 420, NULL, 2013-05-08, NULL), (42000000096, NULL, 420, NULL, 2013-05-08, NULL), (42000000097, NULL, 420, NULL, 2013-05-08, NULL), (42000000098, NULL, 420, NULL, 2013-05-08, NULL), (42000000099, NULL, 420, NULL, 2013-05-08, NULL), (42000000100, NULL, 420, NULL, 2013-05-08, NULL);

INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES (20100000001, NULL, 201, NULL, 2013-06-03, NULL), (20100000002, NULL, 201, NULL, 2013-06-03, NULL), (20100000003, NULL, 201, NULL, 2013-06-03, NULL), (20100000004, NULL, 201, NULL, 2013-06-03, NULL), (20100000005, NULL, 201, NULL, 2013-06-03, NULL), (20100000006, NULL, 201, NULL, 2013-06-03, NULL), (20100000007, NULL, 201, NULL, 2013-06-03, NULL), (20100000008, NULL, 201, NULL, 2013-06-03, NULL), (20100000009, NULL, 201, NULL, 2013-06-03, NULL), (20100000010, NULL, 201, NULL, 2013-06-03, NULL), (20100000011, NULL, 201, NULL, 2013-06-03, NULL), (20100000012, NULL, 201, NULL, 2013-06-03, NULL), (20100000013, NULL, 201, NULL, 2013-06-03, NULL), (20100000014, NULL, 201, NULL, 2013-06-03, NULL), (20100000015, NULL, 201, NULL, 2013-06-03, NULL), (20100000016, NULL, 201, NULL, 2013-06-03, NULL), (20100000017, NULL, 201, NULL, 2013-06-03, NULL), (20100000018, NULL, 201, NULL, 2013-06-03, NULL), (20100000019, NULL, 201, NULL, 2013-06-03, NULL), (20100000020, NULL, 201, NULL, 2013-06-03, NULL), (20100000021, NULL, 201, NULL, 2013-06-03, NULL), (20100000022, NULL, 201, NULL, 2013-06-03, NULL), (20100000023, NULL, 201, NULL, 2013-06-03, NULL), (20100000024, NULL, 201, NULL, 2013-06-03, NULL), (20100000025, NULL, 201, NULL, 2013-06-03, NULL), (20100000026, NULL, 201, NULL, 2013-06-03, NULL), (20100000027, NULL, 201, NULL, 2013-06-03, NULL), (20100000028, NULL, 201, NULL, 2013-06-03, NULL), (20100000029, NULL, 201, NULL, 2013-06-03, NULL), (20100000030, NULL, 201, NULL, 2013-06-03, NULL), (20100000031, NULL, 201, NULL, 2013-06-03, NULL), (20100000032, NULL, 201, NULL, 2013-06-03, NULL), (20100000033, NULL, 201, NULL, 2013-06-03, NULL), (20100000034, NULL, 201, NULL, 2013-06-03, NULL), (20100000035, NULL, 201, NULL, 2013-06-03, NULL), (20100000036, NULL, 201, NULL, 2013-06-03, NULL), (20100000037, NULL, 201, NULL, 2013-06-03, NULL), (20100000038, NULL, 201, NULL, 2013-06-03, NULL), (20100000039, NULL, 201, NULL, 2013-06-03, NULL), (20100000040, NULL, 201, NULL, 2013-06-03, NULL), (20100000041, NULL, 201, NULL, 2013-06-03, NULL), (20100000042, NULL, 201, NULL, 2013-06-03, NULL), (20100000043, NULL, 201, NULL, 2013-06-03, NULL), (20100000044, NULL, 201, NULL, 2013-06-03, NULL), (20100000045, NULL, 201, NULL, 2013-06-03, NULL), (20100000046, NULL, 201, NULL, 2013-06-03, NULL), (20100000047, NULL, 201, NULL, 2013-06-03, NULL), (20100000048, NULL, 201, NULL, 2013-06-03, NULL), (20100000049, NULL, 201, NULL, 2013-06-03, NULL), (20100000050, NULL, 201, NULL, 2013-06-03, NULL), (20100000051, NULL, 201, NULL, 2013-06-03, NULL), (20100000052, NULL, 201, NULL, 2013-06-03, NULL), (20100000053, NULL, 201, NULL, 2013-06-03, NULL), (20100000054, NULL, 201, NULL, 2013-06-03, NULL), (20100000055, NULL, 201, NULL, 2013-06-03, NULL), (20100000056, NULL, 201, NULL, 2013-06-03, NULL), (20100000057, NULL, 201, NULL, 2013-06-03, NULL), (20100000058, NULL, 201, NULL, 2013-06-03, NULL), (20100000059, NULL, 201, NULL, 2013-06-03, NULL), (20100000060, NULL, 201, NULL, 2013-06-03, NULL), (20100000061, NULL, 201, NULL, 2013-06-03, NULL), (20100000062, NULL, 201, NULL, 2013-06-03, NULL), (20100000063, NULL, 201, NULL, 2013-06-03, NULL), (20100000064, NULL, 201, NULL, 2013-06-03, NULL), (20100000065, NULL, 201, NULL, 2013-06-03, NULL), (20100000066, NULL, 201, NULL, 2013-06-03, NULL), (20100000067, NULL, 201, NULL, 2013-06-03, NULL), (20100000068, NULL, 201, NULL, 2013-06-03, NULL), (20100000069, NULL, 201, NULL, 2013-06-03, NULL), (20100000070, NULL, 201, NULL, 2013-06-03, NULL), (20100000071, NULL, 201, NULL, 2013-06-03, NULL), (20100000072, NULL, 201, NULL, 2013-06-03, NULL), (20100000073, NULL, 201, NULL, 2013-06-03, NULL), (20100000074, NULL, 201, NULL, 2013-06-03, NULL), (20100000075, NULL, 201, NULL, 2013-06-03, NULL), (20100000076, NULL, 201, NULL, 2013-06-03, NULL), (20100000077, NULL, 201, NULL, 2013-06-03, NULL), (20100000078, NULL, 201, NULL, 2013-06-03, NULL), (20100000079, NULL, 201, NULL, 2013-06-03, NULL), (20100000080, NULL, 201, NULL, 2013-06-03, NULL), (20100000081, NULL, 201, NULL, 2013-06-03, NULL), (20100000082, NULL, 201, NULL, 2013-06-03, NULL), (20100000083, NULL, 201, NULL, 2013-06-03, NULL), (20100000084, NULL, 201, NULL, 2013-06-03, NULL), (20100000085, NULL, 201, NULL, 2013-06-03, NULL), (20100000086, NULL, 201, NULL, 2013-06-03, NULL), (20100000087, NULL, 201, NULL, 2013-06-03, NULL), (20100000088, NULL, 201, NULL, 2013-06-03, NULL), (20100000089, NULL, 201, NULL, 2013-06-03, NULL), (20100000090, NULL, 201, NULL, 2013-06-03, NULL), (20100000091, NULL, 201, NULL, 2013-06-03, NULL), (20100000092, NULL, 201, NULL, 2013-06-03, NULL), (20100000093, NULL, 201, NULL, 2013-06-03, NULL), (20100000094, NULL, 201, NULL, 2013-06-03, NULL), (20100000095, NULL, 201, NULL, 2013-06-03, NULL), (20100000096, NULL, 201, NULL, 2013-06-03, NULL), (20100000097, NULL, 201, NULL, 2013-06-03, NULL), (20100000098, NULL, 201, NULL, 2013-06-03, NULL), (20100000099, NULL, 201, NULL, 2013-06-03, NULL), (20100000100, NULL, 201, NULL, 2013-06-03, NULL);

INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES (10100000001, NULL, 101, NULL, 2013-07-09, NULL), (10100000002, NULL, 101, NULL, 2013-07-09, NULL), (10100000003, NULL, 101, NULL, 2013-07-09, NULL), (10100000004, NULL, 101, NULL, 2013-07-09, NULL), (10100000005, NULL, 101, NULL, 2013-07-09, NULL), (10100000006, NULL, 101, NULL, 2013-07-09, NULL), (10100000007, NULL, 101, NULL, 2013-07-09, NULL), (10100000008, NULL, 101, NULL, 2013-07-09, NULL), (10100000009, NULL, 101, NULL, 2013-07-09, NULL), (10100000010, NULL, 101, NULL, 2013-07-09, NULL), (10100000011, NULL, 101, NULL, 2013-07-09, NULL), (10100000012, NULL, 101, NULL, 2013-07-09, NULL), (10100000013, NULL, 101, NULL, 2013-07-09, NULL), (10100000014, NULL, 101, NULL, 2013-07-09, NULL), (10100000015, NULL, 101, NULL, 2013-07-09, NULL), (10100000016, NULL, 101, NULL, 2013-07-09, NULL), (10100000017, NULL, 101, NULL, 2013-07-09, NULL), (10100000018, NULL, 101, NULL, 2013-07-09, NULL), (10100000019, NULL, 101, NULL, 2013-07-09, NULL), (10100000020, NULL, 101, NULL, 2013-07-09, NULL), (10100000021, NULL, 101, NULL, 2013-07-09, NULL), (10100000022, NULL, 101, NULL, 2013-07-09, NULL), (10100000023, NULL, 101, NULL, 2013-07-09, NULL), (10100000024, NULL, 101, NULL, 2013-07-09, NULL), (10100000025, NULL, 101, NULL, 2013-07-09, NULL), (10100000026, NULL, 101, NULL, 2013-07-09, NULL), (10100000027, NULL, 101, NULL, 2013-07-09, NULL), (10100000028, NULL, 101, NULL, 2013-07-09, NULL), (10100000029, NULL, 101, NULL, 2013-07-09, NULL), (10100000030, NULL, 101, NULL, 2013-07-09, NULL), (10100000031, NULL, 101, NULL, 2013-07-09, NULL), (10100000032, NULL, 101, NULL, 2013-07-09, NULL), (10100000033, NULL, 101, NULL, 2013-07-09, NULL), (10100000034, NULL, 101, NULL, 2013-07-09, NULL), (10100000035, NULL, 101, NULL, 2013-07-09, NULL), (10100000036, NULL, 101, NULL, 2013-07-09, NULL), (10100000037, NULL, 101, NULL, 2013-07-09, NULL), (10100000038, NULL, 101, NULL, 2013-07-09, NULL), (10100000039, NULL, 101, NULL, 2013-07-09, NULL), (10100000040, NULL, 101, NULL, 2013-07-09, NULL), (10100000041, NULL, 101, NULL, 2013-07-09, NULL), (10100000042, NULL, 101, NULL, 2013-07-09, NULL), (10100000043, NULL, 101, NULL, 2013-07-09, NULL), (10100000044, NULL, 101, NULL, 2013-07-09, NULL), (10100000045, NULL, 101, NULL, 2013-07-09, NULL), (10100000046, NULL, 101, NULL, 2013-07-09, NULL), (10100000047, NULL, 101, NULL, 2013-07-09, NULL), (10100000048, NULL, 101, NULL, 2013-07-09, NULL), (10100000049, NULL, 101, NULL, 2013-07-09, NULL), (10100000050, NULL, 101, NULL, 2013-07-09, NULL); 







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
    customerAlias VARCHAR(20),    
    blankID VARCHAR(11),
    commissionRate INTEGER(10),
    PRIMARY KEY (saleID),
    FOREIGN KEY (customerAlias) REFERENCES Customer(customerAlias),
    FOREIGN KEY (userID) REFERENCES `User`(userID),
    FOREIGN KEY (blankID) REFERENCES Blank(blankID),
    FOREIGN KEY (commissionRate) REFERENCES Commission(commissionRate)
);

INSERT INTO Sale(saleID, usdConversionFactor, userID, fareInLocalCurrency, taxeslocal, taxesOther
currency, `date`, `time`, paymentID, customerAlias, blankID, commissionRate) VALUES






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

INSERT INTO Payment(paymentID, transactionType, confirmed, cardType, cardNumber, dateDue,
 dateReceived, remindersSent) VALUES




CREATE TABLE Refund (
    refundID INTEGER(10),
    saleID INTEGER(10),
    # defines whether the refund was made in full, or what amount of the original sum was refunded
    refundedPortion VARCHAR (10),
    PRIMARY KEY (refundID),
    FOREIGN KEY (saleID) REFERENCES Sale(saleID)
);

INSERT INTO Refund(refundID, saleID, refundedPortion) VALUES





CREATE TABLE Report(
    reportID INTEGER(10) AUTO_INCREMENT,
    salesOfficePlace VARCHAR(50),
    periodStartDate DATE,
    periodEndDate DATE,
    `type` VARCHAR(50),
    PRIMARY KEY (reportID)
);

INSERT INTO Report(reportID, salesOfficePlace, periodStartDate, periodEndDate, `type`) VALUES




CREATE TABLE Sale_Report(
    saleReportID INTEGER(10) AUTO_INCREMENT,
    saleID INTEGER(10),
    reportID INTEGER(10),
    PRIMARY KEY (sale_reportID),
    FOREIGN KEY (saleID) REFERENCES Sale(saleID),
    FOREIGN KEY (reportID) REFERENCES Report(reportID)
);

INSERT INTO SaleReport(saleReportID) VALUES



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
    ("250", MD5("PinkMobile"), "Penelope", "Pitstop", "Travel Advisor"),
    ("211", MD5("Gnasher"), "Dennis", "Menace", "Travel Advisor"),
    ("220", MD5("NotiGirl"), "Minnie", "Minx", "Manager"),
    ("320", MD5("LiesaLot"), "Arthur", "Daley", "Administrator");

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
