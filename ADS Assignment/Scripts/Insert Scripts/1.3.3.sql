SELECT     comment_Message, comment_Type ,
			 LEN(comment_Message) AS 'Comment Length', 
				CASE(comment_Type) WHEN 'Negative' THEN 'Requires Attention' WHEN 'Positive' THEN 'No Attention Required'END AS 'Status'
FROM            all_comments
   
						 WHERE show_Details_ID IN (SELECT Show_Details.show_Details_ID FROM Show_Details WHERE Show_Details.show_Type ='Weekly')
						 ORDER BY all_comments.comment_Message ASC


