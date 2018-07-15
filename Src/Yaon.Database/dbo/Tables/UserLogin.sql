CREATE TABLE [UserLogin]
(
	[LoginProvider] nvarchar(200) NOT NULL,
	[ProviderKey] nvarchar(200) NOT NULL,
	[ProviderDisplayName] nvarchar(200) NULL,
	[UserId] int NOT NULL INDEX IX_UserLogin_UserId, 
	CONSTRAINT PK_UserLogin PRIMARY KEY CLUSTERED
	(
		LoginProvider, 
		ProviderKey
	), 
    CONSTRAINT [FK_UserLogin_User] FOREIGN KEY ([UserId]) REFERENCES [User](Id)
);