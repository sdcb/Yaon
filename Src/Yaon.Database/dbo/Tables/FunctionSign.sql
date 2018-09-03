CREATE TABLE [FunctionSign]
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[QuestionId] int NOT NULL INDEX IX_Function_QuestionId, 
	[Name] nvarchar(100) NOT NULL, 
	[ReturnTypeId] int NOT NULL, 
    CONSTRAINT [FK_Function_Question] FOREIGN KEY ([QuestionId]) REFERENCES [Question](Id) ON DELETE CASCADE, 
	CONSTRAINT [FK_Function_ReturnType] FOREIGN KEY ([ReturnTypeId]) REFERENCES [DataType](Id) ON DELETE NO ACTION
);