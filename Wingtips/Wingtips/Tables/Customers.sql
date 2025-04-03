CREATE TABLE [dbo].[Customers] (
    [VenueId]     INT           NOT NULL,
    [CustomerId]  INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50) NOT NULL,
    [LastName]    NVARCHAR (50) NOT NULL,
    [Email]       VARCHAR (128) NOT NULL,
    [Password]    NVARCHAR (30) NULL,
    [PostalCode]  NVARCHAR (20) NULL,
    [CountryCode] CHAR (3)      NOT NULL,
    [RowVersion]  ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([VenueId] ASC, [CustomerId] ASC),
    CONSTRAINT [FK_Customers_Countries] FOREIGN KEY ([CountryCode]) REFERENCES [dbo].[Countries] ([CountryCode]),
    CONSTRAINT [FK_Customers_Venues] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venues] ([VenueId]),
    CONSTRAINT [AK_Venue_Email] UNIQUE NONCLUSTERED ([VenueId] ASC, [Email] ASC)
);


GO

