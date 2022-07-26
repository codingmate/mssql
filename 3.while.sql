DECLARE @I INT = 0
WHILE @I < 10
  BEGIN
    IF ( @I > 4 )
      BEGIN
        PRINT( ' I > 4' )
        BREAK
        END
    PRINT(@I)
    SET @I = @I + 1
  END
