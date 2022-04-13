CREATE FUNCTION getNumberRequest ( @rSong varchar (255) )
RETURNS INT
AS
BEGIN
DECLARE @nSong int

SET @nSong = (SELECT COUNT(Request_Details.request_Song) From Request_Details
		WHERE Request_Details.request_Song = @rSong)

RETURN @nSong
END