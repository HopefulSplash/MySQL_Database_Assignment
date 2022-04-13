SELECT stuff ((SELECT distinct ', ' + cast(o.organisation_Name as varchar(255))  
           FROM   Organisation_List_Map o1 INNER JOIN
                         Organisation_Details o ON o1.organisation_Details_ID = o.organisation_Details_ID
						 WHERE o1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Organisation,
			 
			 song_Title AS 'Song Title', song_Duration AS 'Song Duration',
		
		
		stuff ((SELECT distinct ', ' + cast(s2.suitability_Type as varchar(255))
           FROM Suitability_List_Map s1 INNER JOIN
                         Suitability_Details s2 ON s1.suitability_Details_ID = s2.suitability_Details_ID
						 WHERE s1.song_Details_ID = s.song_Details_ID
			 FOR XML PATH('')),1,1,'') AS Suitabilitys,

			   stuff ((SELECT distinct ', ' + cast(p.performer_FName as varchar(35)) + ' ' + cast(p.performer_SName as varchar(35)) + ': ' + cast(p.performer_Role as varchar(35))
           FROM   Performer_List_Map p1 INNER JOIN
                         Performer_Details p ON p1.performer_Details_ID = p.performer_Details_ID
						 WHERE p1.song_Details_ID = s.song_Details_ID
			FOR XML PATH('')),1,1,'') AS Performers,
			 
			 CONVERT(varchar, DATEADD(ms, SUM(datediff(SECOND, 0, s.song_Duration)) OVER() * 1000, 0), 114) AS 'Total Combined Length Of Songs'     

FROM Organisation_Details INNER JOIN
                         Organisation_List_Map ON Organisation_Details.organisation_Details_ID = Organisation_List_Map.organisation_Details_ID INNER JOIN
                         Song_Details s ON Organisation_List_Map.song_Details_ID = s.song_Details_ID
						 WHERE Organisation_Details.organisation_Name = 'Beaconside Community Choir'
					