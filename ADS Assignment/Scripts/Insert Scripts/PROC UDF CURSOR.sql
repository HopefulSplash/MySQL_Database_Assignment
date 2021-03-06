CREATE PROCEDURE backup_Popular_Songs_proc @nPlay_Count int
AS
BEGIN

DECLARE	@BACKUP_Songs_Title varchar (255)
DECLARE	@BACKUP_Songs_Duration time 
DECLARE	@BACKUP_Songs_Play_Count int  
DECLARE	@BACKUP_Songs_System date

IF object_id('Popular_Songs_Backup', 'U') is null
	BEGIN		
			CREATE TABLE Popular_Songs_Backup
			(
				popular_Songs_Backup_ID int IDENTITY(1,1) NOT NULL,
				popular_Songs_Title varchar (255) NOT NULL,
				popular_Songs_Duration time NOT NULL,
				popular_Songs_Play_Count int DEFAULT 0, 
				popular_Songs_System date, 
				popular_Songs_Backup date DEFAULT getDate(),

				CONSTRAINT pk_PopularSongID PRIMARY KEY (popular_Songs_Backup_ID),
			)
			PRINT 'Popular_Songs_Backup Table Created'
	END 
	
DECLARE backup_Popular_Songs_csr CURSOR 

FOR
	SELECT * FROM getSongPlayCount_udf(@nPlay_Count)

OPEN backup_Popular_Songs_csr

FETCH NEXT FROM backup_Popular_Songs_csr
INTO	@BACKUP_Songs_Title,
		@BACKUP_Songs_Duration, 
		@BACKUP_Songs_Play_Count,   
		@BACKUP_Songs_System

WHILE @@FETCH_STATUS = 0
BEGIN

	INSERT INTO Popular_Songs_Backup values(
		@BACKUP_Songs_Title,
		@BACKUP_Songs_Duration, 
		@BACKUP_Songs_Play_Count,   
		@BACKUP_Songs_System,
		DEFAULT) 

FETCH NEXT FROM backup_Popular_Songs_csr
INTO	@BACKUP_Songs_Title,
		@BACKUP_Songs_Duration, 
		@BACKUP_Songs_Play_Count,   
		@BACKUP_Songs_System

END
CLOSE backup_Popular_Songs_csr
--close the cursor
DEALLOCATE backup_Popular_Songs_csr
--make this name available again
END
