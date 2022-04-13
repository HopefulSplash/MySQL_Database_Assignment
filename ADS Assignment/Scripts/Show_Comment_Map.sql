CREATE TABLE Show_Comment_Map
(
Show_Comment_Map_ID int IDENTITY(1,1) NOT NULL,
comment_Details_ID int NOT NULL,
show_Instance_ID int NOT NULL,

CONSTRAINT pk_ShowCommentID PRIMARY KEY (Show_Comment_Map_ID),
CONSTRAINT fk_CommentID FOREIGN KEY (comment_Details_ID) REFERENCES Comment_Details (comment_Details_ID),
CONSTRAINT fk_ShowInstanceID_SCMap FOREIGN KEY (show_Instance_ID) REFERENCES Show_Instance (show_Instance_ID)
);