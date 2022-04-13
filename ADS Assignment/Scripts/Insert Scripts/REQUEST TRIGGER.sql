CREATE TRIGGER add_Request_Playlist_tg
ON Request_Details
AFTER INSERT
AS
	DECLARE @songName varchar(255);
	DECLARE @requestID int;

	DECLARE @songID int;
	DECLARE @showID int;
	DECLARE @playlistID int;
	DECLARE @staffID int;

	SELECT @requestID =(SELECT request_Details_ID FROM INSERTED)
	SELECT @songName =(SELECT request_Song FROM INSERTED)

SET @showID = CASE
  WHEN (SELECT request_Dedication FROM INSERTED) IS NULL THEN 9
  ELSE 10
END 


IF(@showID IS NOT NULL)
BEGIN
	IF EXISTS (SELECT Song_Details.song_Title FROM Song_Details WHERE  Song_Details.song_Title = @songName)

	BEGIN

	SET @staffID = (SELECT Show_Staff_Map.staff_Details_ID FROM Show_Instance INNER JOIN
                         Show_Staff_Map ON Show_Instance.show_Instance_ID = Show_Staff_Map.show_Instance_ID
						 WHERE Show_Staff_Map.show_Instance_ID =@showID AND Show_Staff_Map.show_Key_Contact = 1)

	SET @playlistID = (SELECT  Show_Instance.playlist_Details_ID FROM Show_Instance INNER JOIN
                         Playlist_Details ON Show_Instance.playlist_Details_ID = Playlist_Details.playlist_Details_ID
						 WHERE Show_Instance.show_Details_ID = @showID)

	SET @songID = 
	(SELECT Song_Details.song_Details_ID FROM Song_Details
  						 WHERE  Song_Details.song_Title = @songName)


			INSERT INTO Show_Request_Map VALUES (@requestID, @showID);

			INSERT INTO Playlist_Song_Map VALUES (@playlistID, @songID, @staffID);

			PRINT 'The Request Has Been Added To A Playlist.';								 
	END
END
