CREATE TABLE [control].[DeployedVersions] (
    [VersionNumber] NVARCHAR (50)  NOT NULL,
    [DeployedOn]    DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [Description]   NVARCHAR (255) NULL,
    CONSTRAINT [PK_DeployedVersions] PRIMARY KEY CLUSTERED ([VersionNumber] ASC)
);


GO

