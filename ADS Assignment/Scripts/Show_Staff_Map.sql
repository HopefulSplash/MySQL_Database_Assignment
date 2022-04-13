CREATE TABLE Show_Staff_Map
(
show_Staff_Map int IDENTITY(1,1) NOT NULL,
staff_Details_ID int NOT NULL,
show_Instance_ID int NOT NULL,
show_Key_Contact bit NOT NULL,

CONSTRAINT pk_ShowStaffID PRIMARY KEY (show_Staff_Map),
CONSTRAINT fk_Staff_Details_SSMap FOREIGN KEY (staff_Details_ID) REFERENCES Staff_Details (staff_Details_ID),
CONSTRAINT fk_ShowInstanceID_SSMap FOREIGN KEY (show_Instance_ID) REFERENCES Show_Instance (show_Instance_ID),
);