CREATE TABLE Playlist_List_Map
(
playlist_List_Map int IDENTITY(1,1) NOT NULL,
playlist_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,
staff_Details_ID int NOT NULL,

CONSTRAINT pk_PlaylistListID PRIMARY KEY (playlist_List_Map),
CONSTRAINT fk_PlaylistID FOREIGN KEY (playlist_Details_ID) REFERENCES Playlist_Details (playlist_Details_ID),
CONSTRAINT fk_SongID_PSMap FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID),
CONSTRAINT fk_ShowID_PSMap FOREIGN KEY (staff_Details_ID) REFERENCES Staff_Details (staff_Details_ID)
);