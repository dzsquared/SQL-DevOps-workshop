CREATE TABLE [dbo].[Tickets] (
    [VenueId]          INT NOT NULL,
    [TicketId]         INT IDENTITY (1, 1) NOT NULL,
    [RowNumber]        INT NOT NULL,
    [SeatNumber]       INT NOT NULL,
    [EventId]          INT NOT NULL,
    [SectionId]        INT NOT NULL,
    [TicketPurchaseId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([VenueId] ASC, [TicketId] ASC),
    CONSTRAINT [FK_Tickets_EventSections] FOREIGN KEY ([VenueId], [EventId], [SectionId]) REFERENCES [dbo].[EventSections] ([VenueId], [EventId], [SectionId]),
    CONSTRAINT [FK_Tickets_TicketPurchases] FOREIGN KEY ([VenueId], [TicketPurchaseId]) REFERENCES [dbo].[TicketPurchases] ([VenueId], [TicketPurchaseId]) ON DELETE CASCADE,
    CONSTRAINT [AK_Venue_Event_Seat_Ticket] UNIQUE NONCLUSTERED ([VenueId] ASC, [EventId] ASC, [SectionId] ASC, [RowNumber] ASC, [SeatNumber] ASC)
);


GO

