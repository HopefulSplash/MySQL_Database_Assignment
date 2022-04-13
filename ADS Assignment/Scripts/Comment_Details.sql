CREATE TABLE Comment_Details
(
comment_Details_ID int IDENTITY(1,1) NOT NULL,
comment_Message varchar (255) NOT NULL,
comment_Type varchar (8) NOT NULL,


CONSTRAINT pk_CommentID PRIMARY KEY (comment_Details_ID),
CONSTRAINT chk_CommentType CHECK (comment_Type ='Positive' OR comment_Type ='Negative')
);