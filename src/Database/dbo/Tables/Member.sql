﻿CREATE TABLE [dbo].[Member] (
    [MemberId]    INT                IDENTITY (300001, 1) NOT NULL,
    [LastName]    NVARCHAR (50)      NOT NULL,
    [FirstName]   NVARCHAR (50)      NOT NULL,
    [Email]       NVARCHAR (255)     NOT NULL,
    [Phone]       NVARCHAR (50)      NOT NULL,
    [Gender]      INT                NOT NULL,
    [Birthdate]   DATE               NOT NULL,
    [IsDeleted]   BIT                CONSTRAINT [DF_Member_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Created]     DATETIME CONSTRAINT [DF_Member_Created] DEFAULT (GETUTCDATE()) NOT NULL,
    [LastUpdated] DATETIME DEFAULT (GETUTCDATE()) NOT NULL,
    [RowId]       UNIQUEIDENTIFIER   CONSTRAINT [DF_Member_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]   ROWVERSION         NOT NULL,
    CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED ([MemberId] ASC)
);

EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Member',  
@role_name     = NULL,  
@supports_net_changes = 1  
GO  










