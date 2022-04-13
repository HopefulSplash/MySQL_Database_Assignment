CREATE TRIGGER update_Play_Count_tg
ON Show_Instance
AFTER INSERT , UPDATE
AS

	DECLARE @date varchar(100)
	DECLARE @time varchar(100)
	DECLARE @cDate varchar(100) 
	DECLARE @cTime varchar(100) 

	DECLARE @ID int
	
	SELECT @cDate =(convert(varchar, getdate(), 112))
	SELECT @cTime =(convert(varchar, getdate(), 114))

	SELECT @date =(SELECT show_Air_Date FROM INSERTED)
	SELECT @time =(SELECT show_Air_Time FROM INSERTED)
	SELECT @ID =(SELECT show_Details_ID FROM INSERTED)

IF((@date <= @cDate) AND (@time <= @cTime))
BEGIN
	UPDATE Song_Details
			SET song_Play_Count = song_Play_Count + 1
			FROM
										   				 Show_Instance LEFT JOIN
														 Playlist_Details ON Show_Instance.playlist_Details_ID = Playlist_Details.playlist_Details_ID INNER JOIN
														 Playlist_Song_Map ON Playlist_Details.playlist_Details_ID = Playlist_Song_Map.playlist_Details_ID INNER JOIN
														 Song_Details ON Playlist_Song_Map.song_Details_ID = Song_Details.song_Details_ID
			WHERE Show_Instance.show_Instance_ID = @ID 			
			
			PRINT 'The Play Count Has Been Updated.';								 
END