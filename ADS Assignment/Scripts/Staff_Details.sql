CREATE TABLE Staff_Details
(
staff_Details_ID int IDENTITY(1,1) NOT NULL,
address_Details_ID int NOT NULL,
staff_Title varchar (6),
staff_FName varchar (35) NOT NULL,
staff_SName varchar (35) NOT NULL,
staff_PNumber varchar (11),
staff_Email varchar (255),
staff_Role varchar (50) NOT NULL,

CONSTRAINT pk_StaffID PRIMARY KEY (staff_Details_ID),
CONSTRAINT fk_AddressID FOREIGN KEY (address_Details_ID) REFERENCES Address_Details (address_Details_ID),

CONSTRAINT uc_StaffEmail UNIQUE (staff_Email),
CONSTRAINT chk_StaffTitle CHECK (staff_Title ='Mr'OR staff_Title = 'Mrs' OR  staff_Title = 'Ms' OR staff_Title = 'Master' OR staff_Title = 'Miss')

);