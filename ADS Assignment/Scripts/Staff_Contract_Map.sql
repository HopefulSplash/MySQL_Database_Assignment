CREATE TABLE Staff_Contract_Map
(
staff_Contract_Map_ID int IDENTITY(1,1) NOT NULL,
contract_Details_ID int NOT NULL,
staff_Details_ID int NOT NULL,

CONSTRAINT pk_StaffContractID PRIMARY KEY (staff_Contract_Map_ID),
CONSTRAINT fk_ContractID FOREIGN KEY (contract_Details_ID) REFERENCES Contract_Details (contract_Details_ID),
CONSTRAINT fk_StaffID FOREIGN KEY (staff_Details_ID) REFERENCES Staff_Details (staff_Details_ID)
);
