CREATE TABLE Album_List_Map
(
album_List_Map int IDENTITY(1,1) NOT NULL,
album_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,

CONSTRAINT pk_AlbumListID PRIMARY KEY (album_List_Map),
CONSTRAINT fk_AlbumID FOREIGN KEY (album_Details_ID) REFERENCES Album_Details (album_Details_ID),
CONSTRAINT fk_SongID_Album FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID)
);