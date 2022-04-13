SELECT song_Title AS 'Song Title', song_Duration AS 'Song Duration', song_Play_Count AS 'Song Play Count',stuff ((SELECT distinct ', ' + cast(g.genre_Type as varchar(255))
           FROM Genre_List_Map g1 INNER JOIN
                         Genre_Details g ON g1.genre_Details_ID = g.genre_Details_ID
						 WHERE g1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Genres,

		stuff ((SELECT distinct ', ' + cast(s2.suitability_Type as varchar(255))
           FROM Suitability_List_Map s1 INNER JOIN
                         Suitability_Details s2 ON s1.suitability_Details_ID = s2.suitability_Details_ID
						 WHERE s1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Suitabilitys,

			 stuff ((SELECT distinct ', ' + cast(i.instrument_Name as varchar(255))
           FROM  Instrument_List_Map i1 INNER JOIN
                         Instrument_Details i ON i1.instrument_Details_ID = i.instrument_Details_ID
						 WHERE i1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Instruments,

			  stuff ((SELECT distinct ', ' + cast(c.composer_FName as varchar(35)) + ' ' + cast(c.composer_SName as varchar(35))
           FROM   Composer_List_Map c1 INNER JOIN
                         Composer_Details c ON c1.composer_Details_ID = c.composer_Details_ID
						 WHERE c1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Composers,

			   stuff ((SELECT distinct ', ' + cast(p.performer_FName as varchar(35)) + ' ' + cast(p.performer_SName as varchar(35)) + ': ' + cast(p.performer_Role as varchar(35))
           FROM   Performer_List_Map p1 INNER JOIN
                         Performer_Details p ON p1.performer_Details_ID = p.performer_Details_ID
						 WHERE p1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Performers,

			 			 			  stuff ((SELECT distinct ', ' + cast(a.album_Name as varchar(35))
           FROM   Album_List_Map a1 INNER JOIN
                         Album_Details a ON a1.album_Details_ID = a.album_Details_ID
						 WHERE a1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Album,

				 			  stuff ((SELECT distinct ', ' + cast(o.organisation_Name as varchar(255)) + ': ' + cast(o.organisation_Type as varchar(255)) + ', ' + cast(CASE o.organisation_Local 
                    WHEN 1 THEN 'Local' 
                    ELSE 'Not Local' END as varchar(255)) + ': ' + cast(o.organisation_Founded as varchar(35)) 
           FROM   Organisation_List_Map o1 INNER JOIN
                         Organisation_Details o ON o1.organisation_Details_ID = o.organisation_Details_ID
						 WHERE o1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Organisation,  song_Added AS 'Song Added'


FROM Song_Details s INNER JOIN
                         Playlist_Song_Map ON s.song_Details_ID = Playlist_Song_Map.song_Details_ID INNER JOIN
                         Playlist_Details ON Playlist_Song_Map.playlist_Details_ID = Playlist_Details.playlist_Details_ID INNER JOIN
                         Show_Instance ON Playlist_Details.playlist_Details_ID = Show_Instance.playlist_Details_ID

						 WHERE Show_Instance.show_Details_ID = (SELECT Show_Details.show_Details_ID FROM Show_Details WHERE Show_Details.show_Name = 'Your Choice Show')