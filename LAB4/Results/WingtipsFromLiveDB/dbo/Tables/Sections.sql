CREATE TABLE [dbo].[Sections] (
    [VenueId]       INT           NOT NULL,
    [SectionId]     INT           IDENTITY (1, 1) NOT NULL,
    [SectionName]   NVARCHAR (30) NOT NULL,
    [SeatRows]      SMALLINT      DEFAULT ((20)) NOT NULL,
    [SeatsPerRow]   SMALLINT      DEFAULT ((30)) NOT NULL,
    [StandardPrice] MONEY         DEFAULT ((10)) NOT NULL,
    [RowVersion]    ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([VenueId] ASC, [SectionId] ASC),
    CONSTRAINT [CK_Sections_SeatRows] CHECK ([SeatRows]<=(1000) AND [SeatRows]>(0)),
    CONSTRAINT [CK_Sections_SeatsPerRow] CHECK ([SeatsPerRow]<=(1000) AND [SeatsPerRow]>(0)),
    CONSTRAINT [CK_Sections_StandardPrice] CHECK ([StandardPrice]<=(100000)),
    CONSTRAINT [FK_Sections_Venues] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venues] ([VenueId])
);


GO

