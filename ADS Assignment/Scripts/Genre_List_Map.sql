CREATE TABLE Genre_List_Map
(
genre_List_Map int IDENTITY(1,1) NOT NULL,
genre_Details_ID int NOT NULL,
song_Details_ID int,
show_Details_ID int,

CONSTRAINT pk_GenreListID PRIMARY KEY (genre_List_Map),
CONSTRAINT fk_GenreID FOREIGN KEY (genre_Details_ID) REFERENCES Genre_Details (genre_Details_ID),
CONSTRAINT fk_SongID_Genre FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID),
CONSTRAINT fk_ShowID_Genre FOREIGN KEY (show_Details_ID) REFERENCES Show_Details (show_Details_ID)
);