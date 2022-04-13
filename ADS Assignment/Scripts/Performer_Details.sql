CREATE TABLE Performer_Details
(
performer_Details int IDENTITY(1,1) NOT NULL,
performer_FName varchar (35) NOT NULL,
performer_SName varchar (35) NOT NULL,
performer_Role varchar (50) NOT NULL,

CONSTRAINT pk_PerformerID PRIMARY KEY (performer_Details)
);