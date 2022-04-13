CREATE TABLE Contract_Details
(
contract_Details_ID int IDENTITY(1,1) NOT NULL,
contract_Type varchar (35) NOT NULL,
contract_SDate date NOT NULL,
contract_FDate date,

CONSTRAINT pk_ContractID PRIMARY KEY (contract_Details_ID),
CONSTRAINT chk_ContractType CHECK (contract_Type ='Full Time Permanent' OR contract_Type ='Part Time' OR contract_Type ='Casual Contract' OR contract_Type ='Volunteer' OR contract_Type ='Intern')
);