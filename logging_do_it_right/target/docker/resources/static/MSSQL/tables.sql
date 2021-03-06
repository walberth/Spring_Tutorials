USE MASTER
IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'xxxxx')
    DROP DATABASE xxxxx

CREATE DATABASE xxxxx;
GO

USE xxxxx
GO

/****** Object:  Table [dbo].[person] ******/
IF (EXISTS (SELECT *
            FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
				AND  TABLE_NAME = 'person'))
BEGIN
	DROP TABLE [dbo].[person]
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[person](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[firstName] [varchar](50) NOT NULL,
		[motherLastName] [varchar](50),
		[fatherLastName] [varchar](50),
		[sex] [bit] NULL,
		[birthDate] [datetime] NULL,
		[document] [varchar](50) NOT NULL,
		[email] [varchar](50),
		[mobile] [varchar](50),
		[telephone] [varchar](50),
		[usernameRegister] [varchar](50),
		[timeStamp] [datetime] NOT NULL,
	CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[person] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[person] ADD  DEFAULT (getdate()) FOR [timeStamp]
END
ELSE
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[person](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[firstName] [varchar](50) NOT NULL,
		[motherLastName] [varchar](50),
		[fatherLastName] [varchar](50),
		[sex] [bit] NULL,
		[birthDate] [datetime] NULL,
		[document] [varchar](50) NOT NULL,
		[email] [varchar](50),
		[mobile] [varchar](50),
		[telephone] [varchar](50),
		[usernameRegister] [varchar](50),
		[timeStamp] [datetime] NOT NULL,
	CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[person] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[person] ADD  DEFAULT (getdate()) FOR [timeStamp]
END

/****** Object:  Table [dbo].[role] ******/
IF (EXISTS (SELECT *
                FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'dbo'
                AND  TABLE_NAME = 'role'))
BEGIN
	DROP TABLE [dbo].[role]
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[role](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [varchar](50) NOT NULL,
	CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[role] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[role](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [varchar](50) NOT NULL,
	CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[role] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END

/****** Object:  Table [dbo].[permission] ******/
IF (EXISTS (SELECT *
                FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'dbo'
                AND  TABLE_NAME = 'permission'))
BEGIN
	DROP TABLE [dbo].[permission]
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[permission](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [varchar](50) NOT NULL,
		[role_id] INT,
	CONSTRAINT [PK_PERMISSION] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[permission] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[permission]  WITH CHECK ADD  CONSTRAINT [permission_fk0] FOREIGN KEY([idRole])
	REFERENCES [dbo].[role] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[permission] CHECK CONSTRAINT [permission_fk0]
END
ELSE
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[permission](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [varchar](50) NOT NULL,
		[idRole] INT,
	CONSTRAINT [PK_PERMISSION] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[permission] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[permission]  WITH CHECK ADD  CONSTRAINT [permission_fk0] FOREIGN KEY([idRole])
	REFERENCES [dbo].[role] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[permission] CHECK CONSTRAINT [permission_fk0]
END

/****** Object:  Table [dbo].[user] ******/
IF (EXISTS (SELECT *
                FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'dbo'
                AND  TABLE_NAME = 'user'))
BEGIN
	DROP TABLE [dbo].[user]
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[user](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[idPerson] [int] NOT NULL,
		[idRole] [int] NOT NULL,
		[username] [varchar](50) NOT NULL,
		[password] [varchar](max) NOT NULL,
		[active] [bit] NOT NULL,
		[usernameRegister] [varchar](50),
		[timeStamp] [datetime] NOT NULL,
	CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED ([idPerson] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD  DEFAULT (getdate()) FOR [timeStamp]

	ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user_fk0] FOREIGN KEY([idPerson])
	REFERENCES [dbo].[person] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user_fk0]

	ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user_fk1] FOREIGN KEY([idRole])
	REFERENCES [dbo].[role] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user_fk1]
END
ELSE
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[user](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[idPerson] [int] NOT NULL,
		[idRole] [int] NOT NULL,
		[username] [varchar](50) NOT NULL,
		[password] [varchar](max) NOT NULL,
		[active] [bit] NOT NULL,
		[usernameRegister] [varchar](50),
		[timeStamp] [datetime] NOT NULL,
	CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED ([idPerson] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[user] ADD  DEFAULT (getdate()) FOR [timeStamp]

	ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user_fk0] FOREIGN KEY([idPerson])
	REFERENCES [dbo].[person] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user_fk0]

	ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user_fk1] FOREIGN KEY([idRole])
	REFERENCES [dbo].[role] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user_fk1]
END

/****** Object:  Table [dbo].[session] ******/
IF (EXISTS (SELECT *
                FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'dbo'
                AND  TABLE_NAME = 'session'))
BEGIN
	DROP TABLE [dbo].[session]
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[session](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[idUser] [int] NOT NULL,
		[token] [varchar](max) NOT NULL,
		[timeRelease] [int] NOT NULL,
		[expirationTime] [datetime] NULL,
	CONSTRAINT [PK_SESSION] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[session] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[session] ADD UNIQUE NONCLUSTERED ([idUser] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[session] ADD  DEFAULT (getdate()) FOR [timeStamp]

	ALTER TABLE [dbo].[session]  WITH CHECK ADD  CONSTRAINT [session_fk0] FOREIGN KEY([idUser])
	REFERENCES [dbo].[user] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[session] CHECK CONSTRAINT [session_fk0]
END
ELSE
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[session](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[idUser] [int] NOT NULL,
		[token] [varchar](max) NOT NULL,
		[timeRelease] [int] NOT NULL,
		[expirationTime] [datetime] NULL,
	CONSTRAINT [PK_SESSION] PRIMARY KEY CLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[session] ADD UNIQUE NONCLUSTERED ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[session] ADD UNIQUE NONCLUSTERED ([idUser] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE [dbo].[session]  WITH CHECK ADD  CONSTRAINT [session_fk0] FOREIGN KEY([idUser])
	REFERENCES [dbo].[user] ([id])
	ON UPDATE CASCADE
	ALTER TABLE [dbo].[session] CHECK CONSTRAINT [session_fk0]
END