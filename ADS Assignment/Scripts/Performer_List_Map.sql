CREATE TABLE Performer_List_Map
(
performer_List_Map_ID int IDENTITY(1,1) NOT NULL,
performer_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,

CONSTRAINT pk_PerformerListID PRIMARY KEY (performer_List_Map_ID),
CONSTRAINT fk_PerformerID FOREIGN KEY (performer_Details_ID) REFERENCES Performer_Details (performer_Details_ID),
CONSTRAINT fk_SongID_Performer FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID)
);