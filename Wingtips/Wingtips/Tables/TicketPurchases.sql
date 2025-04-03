CREATE TABLE [dbo].[TicketPurchases] (
    [VenueId]          INT        NOT NULL,
    [TicketPurchaseId] INT        IDENTITY (1, 1) NOT NULL,
    [PurchaseDate]     DATETIME   NOT NULL,
    [PurchaseTotal]    MONEY      NOT NULL,
    [CustomerId]       INT        NOT NULL,
    [RowVersion]       ROWVERSION NOT NULL,
    PRIMARY KEY CLUSTERED ([VenueId] ASC, [TicketPurchaseId] ASC),
    CONSTRAINT [FK_TicketPurchases_Customers] FOREIGN KEY ([VenueId], [CustomerId]) REFERENCES [dbo].[Customers] ([VenueId], [CustomerId])
);


GO

