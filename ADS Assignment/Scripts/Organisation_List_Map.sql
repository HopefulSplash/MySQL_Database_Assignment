CREATE TABLE Organisation_List_Map
(
organisation_List_Map int IDENTITY(1,1) NOT NULL,
organisation_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,

CONSTRAINT pk_OrganisationListID PRIMARY KEY (organisation_List_Map),
CONSTRAINT fk_OrganisationID FOREIGN KEY (organisation_Details_ID) REFERENCES Organisation_Details (organisation_Details_ID),
CONSTRAINT fk_SongID_Organisation FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID)
);