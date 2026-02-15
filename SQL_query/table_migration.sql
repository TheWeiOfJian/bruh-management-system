CREATE TABLE [dbo].[Event] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [event_title]       VARCHAR (50)  NOT NULL,
    [event_description] VARCHAR (MAX) NOT NULL,
    [start_time]        DATETIME      NOT NULL,
    [end_time]          DATETIME      NOT NULL,
    [venue]             VARCHAR (100) NOT NULL,
    [is_ended]          BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[User] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [user_email]    VARCHAR (50) NOT NULL,
    [user_name]     VARCHAR (50) NOT NULL,
    [user_password] VARCHAR (50) NOT NULL,
    [phone_number]  VARCHAR (15) NOT NULL,
    [role]          VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[User_Event] (
    [Id]       INT IDENTITY (1, 1) NOT NULL,
    [user_Id]  INT NOT NULL,
    [event_Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_User_Event_Event] FOREIGN KEY ([event_Id]) REFERENCES [dbo].[Event] ([Id]),
    CONSTRAINT [FK_User_Event_User] FOREIGN KEY ([user_Id]) REFERENCES [dbo].[User] ([Id])
);
GO



