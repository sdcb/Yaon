CREATE TABLE Question
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[Title] nvarchar(100) NOT NULL, 
	[Description] nvarchar(max) NOT NULL, 
	EvalTypeId int NOT NULL 
		CONSTRAINT FK_Question_EvalType FOREIGN KEY REFERENCES EvalType(Id) ON DELETE NO ACTION, 
	[CreateTime] datetime2 NOT NULL INDEX IX_Question_CreateTime NONCLUSTERED, 
	[ModifyTime] datetime2 NOT NULL INDEX IX_Question_ModifyTime NONCLUSTERED
);