CREATE TABLE Composer_Details
(
composer_Details int IDENTITY(1,1) NOT NULL,
composer_FName varchar (35) NOT NULL,
composer_SName varchar (35) NOT NULL,

CONSTRAINT pk_ComposerID PRIMARY KEY (composer_Details)
);