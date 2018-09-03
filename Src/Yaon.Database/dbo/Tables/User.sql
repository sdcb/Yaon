CREATE TABLE [User]
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[UserName] nvarchar(200) NOT NULL INDEX IX_User_UserName,
	[Email] nvarchar(200) NOT NULL INDEX IX_User_Email,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[PhoneNumber] varchar(20) NULL INDEX IX_User_Phone
);