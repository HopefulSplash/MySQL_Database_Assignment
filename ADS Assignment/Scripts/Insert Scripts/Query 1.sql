SELECT        Song_Details.song_Title, Song_Details.song_Duration, Song_Details.song_Play_Count, Song_Details.song_Added, Suitability_Details.suitability_Type, Genre_Details.genre_Type
FROM            Show_Details   LEFT JOIN
                         Show_Instance ON Show_Details.show_Details_ID = Show_Instance.show_Details_ID LEFT JOIN
                         Playlist_Details ON Show_Instance.playlist_Details_ID = Playlist_Details.playlist_Details_ID LEFT JOIN
                         Playlist_Song_Map ON Playlist_Details.playlist_Details_ID = Playlist_Song_Map.playlist_Details_ID LEFT JOIN
                         Song_Details ON Playlist_Song_Map.song_Details_ID = Song_Details.song_Details_ID LEFT JOIN
						 Suitability_List_Map ON Suitability_List_Map.song_Details_ID = Song_Details.song_Details_ID LEFT JOIN
						 Suitability_Details ON Suitability_List_Map.suitability_Details_ID = Suitability_Details.suitability_Details_ID LEFT JOIN
						  Genre_List_Map ON Genre_List_Map.song_Details_ID = Song_Details.song_Details_ID LEFT JOIN
							 Genre_Details ON Genre_List_Map.genre_Details_ID = Genre_Details.genre_Details_ID
						

						 WHERE Show_Details.show_Name = 'Your Choice Show' AND Show_Instance.show_Air_Date = '20131209' AND Show_Instance.show_Air_Time = '18:00:00'
						 GROUP BY   Song_Details.song_Title;
