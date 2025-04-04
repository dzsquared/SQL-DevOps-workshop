  MERGE INTO [dbo].[Countries] as [target]
  USING (VALUES
      ('USA', 'United States','en-us')
  ) as [source] ([CountryCode],[CountryName],[Language])
  ON [target].[CountryCode] = [source].[CountryCode]
  WHEN MATCHED THEN
      UPDATE SET [target].[CountryName] = [source].[CountryName], [target].[Language] = [source].[Language]
  WHEN NOT MATCHED BY TARGET THEN
      INSERT
      ([CountryCode],[CountryName],[Language])
  VALUES
      ([CountryCode],[CountryName],[Language]);
  GO


  MERGE INTO [dbo].[VenueTypes] AS [target]
  USING (VALUES
      ('multipurpose','Multi-Purpose Venue','Event', 'Event','Events','en-us'),
      ('classicalmusic','Classical Music Venue','Classical Concert','Concert','Concerts','en-us'),
      ('jazz','Jazz Venue','Jazz Session','Session','Sessions','en-us'),
      ('judo','Judo Venue','Judo Tournament','Tournament','Tournaments','en-us'),
      ('soccer','Soccer Venue','Soccer Match', 'Match','Matches','en-us'),
      ('motorracing','Motor Racing Venue','Car Race', 'Race','Races','en-us'),
      ('dance', 'Dance Venue', 'Dance Performance', 'Performance', 'Performances','en-us'),
      ('blues', 'Blues Venue', 'Blues Session', 'Session','Sessions','en-us' ),
      ('rockmusic','Rock Music Venue','Rock Concert','Concert', 'Concerts','en-us'),
      ('opera','Opera Venue','Opera','Opera','Operas','en-us'),
      ('motorcycleracing','Motorcycle Racing Venue','Motorcycle Race', 'Race', 'Races', 'en-us'),
      ('swimming','Swimming Venue','Swimming Meet','Meet','Meets','en-us')
  ) AS source(
      VenueType,VenueTypeName,EventTypeName,EventTypeShortName,EventTypeShortNamePlural,[Language]
  )              
  ON [target].VenueType = source.VenueType
  -- update existing rows
  WHEN MATCHED THEN
      UPDATE SET 
          VenueTypeName = source.VenueTypeName,
          EventTypeName = source.EventTypeName,
          EventTypeShortName = source.EventTypeShortName,
          EventTypeShortNamePlural = source.EventTypeShortNamePlural,
          [Language] = source.[Language]
  -- insert new rows
  WHEN NOT MATCHED BY TARGET THEN
      INSERT (VenueType,VenueTypeName,EventTypeName,EventTypeShortName,EventTypeShortNamePlural,[Language])
      VALUES (VenueType,VenueTypeName,EventTypeName,EventTypeShortName,EventTypeShortNamePlural,[Language])
  ;
  GO