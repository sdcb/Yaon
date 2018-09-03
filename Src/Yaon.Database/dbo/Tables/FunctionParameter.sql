CREATE TABLE FunctionParameter
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[FunctionId] int NOT NULL INDEX IX_FunctionParameter_FunctionId,
	[DataTypeId] int NOT NULL INDEX IX_FunctionParameter_DataType,
	[Name] nvarchar(100) NOT NULL, 
	[Order] int NOT NULL, 
    CONSTRAINT [FK_FunctionParameter_Function] FOREIGN KEY ([FunctionId]) REFERENCES [FunctionSign](Id) ON DELETE CASCADE, 
    CONSTRAINT [FK_FunctionParameter_DataType] FOREIGN KEY ([DataTypeId]) REFERENCES [DataType](Id) ON DELETE NO ACTION
);