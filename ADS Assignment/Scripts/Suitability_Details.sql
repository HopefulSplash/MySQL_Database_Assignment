CREATE TABLE Suitability_Details
(
suitability_Details_ID int IDENTITY(1,1) NOT NULL,
suitability_Type varchar (16),

CONSTRAINT pk_SuitabilityID PRIMARY KEY (suitability_Details_ID),
CONSTRAINT chk_SuitabilityType CHECK (suitability_Type ='Pre-School' OR suitability_Type ='Junior School' OR suitability_Type ='Secondary School' OR suitability_Type ='Adult' OR suitability_Type ='Older Citizen' OR suitability_Type ='Risky')
);

