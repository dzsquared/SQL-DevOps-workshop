CREATE TABLE [dbo].[Countries] (
    [CountryCode] CHAR (3)      NOT NULL,
    [CountryName] NVARCHAR (50) NOT NULL,
    [Language]    NVARCHAR (10) DEFAULT ('en') NOT NULL,
    PRIMARY KEY CLUSTERED ([CountryCode] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries_Country_Language]
    ON [dbo].[Countries]([CountryCode] ASC, [Language] ASC);


GO

