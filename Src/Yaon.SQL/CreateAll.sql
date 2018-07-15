BEGIN TRAN

-- User Related
CREATE TABLE [User]
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[UserName] nvarchar(200) NULL INDEX IX_User_UserName,
	[Email] nvarchar(200) NULL INDEX IX_User_Email,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[PhoneNumber] varchar(20) NULL INDEX IX_User_Phone
);


CREATE TABLE [UserLogin]
(
	[LoginProvider] nvarchar(200) NOT NULL,
	[ProviderKey] nvarchar(200) NOT NULL,
	[ProviderDisplayName] nvarchar(max) NULL,
	[UserId] int NOT NULL INDEX IX_UserLogin_UserId 
		CONSTRAINT FK_UserLogin_User FOREIGN KEY REFERENCES [User](Id) ON DELETE CASCADE, 
	CONSTRAINT PK_UserLogin PRIMARY KEY CLUSTERED
	(
		LoginProvider, 
		ProviderKey
	)
);

-- Question/Solution related
CREATE TABLE EvaluationMethod
(
	[Id] int NOT NULL PRIMARY KEY, 
	[Name] varchar(20) NOT NULL INDEX IX_EvaluationMethod_Name
)

INSERT INTO EvaluationMethod VALUES(1, 'Functional')

CREATE TABLE Question
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[Title] nvarchar(100) NOT NULL, 
	[Description] nvarchar(max) NOT NULL, 
	[EvaluationMethodId] int NOT NULL 
		CONSTRAINT FK_Question_EvaluationMethod FOREIGN KEY REFERENCES [EvaluationMethod](Id) ON DELETE NO ACTION, 
	[CreateTime] datetime2 NOT NULL INDEX IX_Question_CreateTime NONCLUSTERED, 
	[ModifyTime] datetime2 NOT NULL INDEX IX_Question_ModifyTime NONCLUSTERED
);

CREATE TABLE DataType
(
	[Id] int NOT NULL PRIMARY KEY, 
	[Name] varchar(100) NOT NULL INDEX IX_DataType_Name
);

INSERT INTO DataType VALUES(1, 'Int32');
INSERT INTO DataType VALUES(2, 'String');
INSERT INTO DataType VALUES(3, 'Double');
INSERT INTO DataType VALUES(4, 'IEnumerable<Int32>');

CREATE TABLE FunctionDefinition
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[QuestionId] int NOT NULL INDEX IX_FunctionDefinition_QuestionId 
		CONSTRAINT FK_FunctionDefinition_Question FOREIGN KEY REFERENCES [Question](Id) ON DELETE CASCADE, 
	[Name] nvarchar(100) NOT NULL, 
	[ReturnType] int NOT NULL
);

CREATE TABLE FunctionParameter
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(1, 1), 
	[FunctionId] int NOT NULL INDEX IX_FunctionParameter_FunctionId
		CONSTRAINT FK_FunctionParameter_Definition FOREIGN KEY REFERENCES [FunctionDefinition](Id) ON DELETE CASCADE, 
	[DataTypeId] int NOT NULL INDEX IX_FunctionParameter_DataType
		CONSTRAINT FK_FunctionParameter_DataType FOREIGN KEY REFERENCES [DataType](Id) ON DELETE NO ACTION, 
	[Name] nvarchar(100) NOT NULL, 
	[Order] int NOT NULL
);

COMMIT