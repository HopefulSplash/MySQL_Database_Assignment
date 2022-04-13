CREATE TABLE Suitability_List_Map
(
suitability_List_Map_ID int IDENTITY(1,1) NOT NULL,
suitability_Details_ID int NOT NULL,
song_Details_ID int,
show_Details_ID int,

CONSTRAINT pk_SuitabilityListID PRIMARY KEY (suitability_List_Map_ID),
CONSTRAINT fk_SuitabilityID FOREIGN KEY (suitability_Details_ID) REFERENCES Suitability_Details (suitability_Details_ID),
CONSTRAINT fk_SongID_Suitability FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID),
CONSTRAINT fk_ShowID_Suitability FOREIGN KEY (show_Details_ID) REFERENCES Show_Details (show_Details_ID)
);