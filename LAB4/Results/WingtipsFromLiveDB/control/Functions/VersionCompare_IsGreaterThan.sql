CREATE FUNCTION control.VersionCompare_IsGreaterThan
(
    @Version1 NVARCHAR(50),
    @Version2 NVARCHAR(50)
)
RETURNS BIT -- 1 when @Version1 > @Version2, 0 when @Version1 <= @Version2
AS
BEGIN
  DECLARE @greaterThan BIT = 0
  SET @greaterThan = (SELECT CASE WHEN convert(int, parsename(@Version1, 4)) > convert(int, parsename(@Version2, 4)) THEN 1  
    WHEN convert(int, parsename(@Version1, 4)) < convert(int, parsename(@Version2, 4)) THEN 0  
    ELSE CASE   
      WHEN convert(int, parsename(@Version1, 3)) > convert(int, parsename(@Version2, 3)) THEN 1  
      WHEN convert(int, parsename(@Version1, 3)) < convert(int, parsename(@Version2, 3)) THEN 0  
      ELSE CASE   
        WHEN convert(int, parsename(@Version1, 2)) > convert(int, parsename(@Version2, 2)) THEN 1  
        WHEN convert(int, parsename(@Version1, 2)) < convert(int, parsename(@Version2, 2)) THEN 0  
        ELSE CASE   
          WHEN convert(int, parsename(@Version1, 1)) > convert(int, parsename(@Version2, 1)) THEN 1  
          WHEN convert(int, parsename(@Version1, 1)) < convert(int, parsename(@Version2, 1)) THEN 0  
          ELSE 0 -- 'equal' 
    END END END END)

  RETURN @greaterThan
END

GO

