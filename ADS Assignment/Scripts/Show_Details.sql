CREATE TABLE Show_Details
(
show_Details_ID int IDENTITY(1,1) NOT NULL,
show_Name varchar (255) NOT NULL,
show_Type varchar (20) NOT NULL,

CONSTRAINT pk_ShowID PRIMARY KEY (show_Details_ID),
CONSTRAINT chk_ShowType CHECK (show_Type ='One Off Broadcast' OR show_Type ='Daily' OR show_Type ='Weekly' OR show_Type ='Monthly')

);
