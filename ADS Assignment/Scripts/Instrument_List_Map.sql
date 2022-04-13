CREATE TABLE Instrument_List_Map
(
instrument_List_Map int IDENTITY(1,1) NOT NULL,
instrument_Details_ID int NOT NULL,
song_Details_ID int NOT NULL,

CONSTRAINT pk_InstrumentListID PRIMARY KEY (instrument_List_Map),
CONSTRAINT fk_InstrumentID FOREIGN KEY (instrument_Details_ID) REFERENCES Instrument_Details (instrument_Details_ID),
CONSTRAINT fk_SongID_Instrument FOREIGN KEY (song_Details_ID) REFERENCES Song_Details (song_Details_ID)
);
