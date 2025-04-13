
CREATE VIEW dbo.MusicVenues
AS
SELECT v.VenueId
  , v.VenueName
  , v.VenueType
  , v.AdminEmail
  , v.AdminPassword
  , v.PostalCode
  , v.CountryCode
  , v.RowVersion
FROM dbo.Venues v
LEFT JOIN dbo.VenueTypes vt
ON v.VenueType = vt.VenueType
WHERE vt.EventTypeShortName IN ('Concert', 'Session', 'Opera')

GO

