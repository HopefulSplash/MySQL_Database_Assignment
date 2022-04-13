CREATE TABLE Composer_List_Map
(
composer_List_Map_ID int IDENTITY(1,1) NOT NULL,
composer_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,

CONSTRAINT pk_ComposerListID PRIMARY KEY (composer_List_Map_ID),
CONSTRAINT fk_ComposerID FOREIGN KEY (composer_Details_ID) REFERENCES Composer_Details (composer_Details_ID),
CONSTRAINT fk_SongID_Composer FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID)
);