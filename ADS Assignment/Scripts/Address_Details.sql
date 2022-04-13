CREATE TABLE Address_Details
(
address_Details_ID int IDENTITY(1,1) NOT NULL,
address_Street varchar (35) NOT NULL,
address_Postcode varchar (9) NOT NULL,
address_City varchar (20) NOT NULL,
address_County varchar (20) NOT NULL,

CONSTRAINT pk_AddressID PRIMARY KEY (address_Details_ID),
);