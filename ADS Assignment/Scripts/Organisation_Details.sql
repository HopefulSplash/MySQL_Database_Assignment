CREATE TABLE Organisation_Details
(
organisation_Details int IDENTITY(1,1) NOT NULL,
organisation_Name varchar (255) NOT NULL,
organisation_Type varchar (255) NOT NULL,
organisation_Local bit, 
organisation_Founded date,

CONSTRAINT pk_OrganisationID PRIMARY KEY (organisation_Details),
CONSTRAINT chk_OrganisationLocal CHECK (organisation_Local = 0 OR organisation_Local = 1)
);
