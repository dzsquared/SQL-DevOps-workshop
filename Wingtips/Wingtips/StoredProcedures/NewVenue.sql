    -- Creates a new Venue
  CREATE PROCEDURE [dbo].[NewVenue]
      @VenueId  INT,
      @VenueName NVARCHAR(128),
      @VenueType NVARCHAR(30) = 'multipurpose',
      @PostalCode NVARCHAR(20) = '98052',
      @CountryCode CHAR(3) = 'USA'
  AS
      IF @VenueId IS NULL
      BEGIN
          RAISERROR ('Error. @VenueId must be specified', 11, 1)
          RETURN 1
      END
  
      IF @VenueName IS NULL
      BEGIN
          RAISERROR ('Error. @VenueName must be specified', 11, 1)
          RETURN 1
      END
  
  
      -- Insert Venue
      INSERT INTO [dbo].Venues
          ([VenueId],[VenueName],[VenueType],[AdminEmail],[CountryCode], [PostalCode])         
      VALUES
          (@VenueId, @VenueName,@VenueType,'admin@email.com',@CountryCode, @PostalCode)
  
  RETURN 0