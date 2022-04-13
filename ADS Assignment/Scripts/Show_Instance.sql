CREATE TABLE Show_Instance
(
show_Instance_ID int IDENTITY(1,1) NOT NULL,
show_Details_ID int NOT NULL,
show_Air_Date date NOT NULL,
show_Air_Time time NOT NULL,


CONSTRAINT pk_ShowInstanceID PRIMARY KEY (show_Instance_ID),
CONSTRAINT fk_ShowID_ShowInstance FOREIGN KEY (show_Details_ID) REFERENCES Show_Details (show_Details_ID),
);
