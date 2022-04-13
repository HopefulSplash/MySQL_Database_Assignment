CREATE TABLE Song_Details
(
song_Details_ID int IDENTITY(1,1) NOT NULL,
song_Title varchar (255) NOT NULL,
song_Duration time NOT NULL,
song_Play_Count int DEFAULT 0, 

CONSTRAINT pk_SongID PRIMARY KEY (song_Details_ID),
);