CREATE PROCEDURE create_Most_Request_proc @sName varchar(255), @nRequest int
AS

DECLARE @nSong int

	IF EXISTS (SELECT Song_Details.song_Title FROM Song_Details WHERE  Song_Details.song_Title = @sName)
		BEGIN
				PRINT 'Song Already In Database'
		END
	ELSE IF EXISTS(SELECT Request_Details.request_Song FROM Request_Details WHERE  Request_Details.request_Song = @sName)
		BEGIN

			EXEC @nSong = getNumberRequest_udf @rSong= @sName

			IF (@nSong > = @nRequest)
				BEGIN
						IF object_id('Most_Request_NoDB', 'U') is not null
							BEGIN
								 INSERT INTO Most_Request_NoDB VALUES (@sName, DEFAULT);

								 PRINT 'Adding Song Request To Most_Request_NoDB'
							 END

				END
			ELSE
				BEGIN	
							CREATE TABLE Most_Request_NoDB
							(
							most_Request_NoDB_ID int IDENTITY(1,1) NOT NULL,
							request_Song varchar (255) NOT NULL,
							request_Date date DEFAULT getDate(), 

							CONSTRAINT pk_MostRequestID PRIMARY KEY (most_Request_NoDB_ID),

							)
						  PRINT 'Most_Request_NoDB Table Created'
				END 
		END
	ELSE
		BEGIN
			PRINT 'This Song Has Never Been Requested'
		END
GO