  DECLARE @TEMP_TABLE TABLE (
        ID    NUMERIC PRIMARY KEY
      , CLASS VARCHAR(10)
      , NAME  VARCHAR(10)
      , AGE   NUMERIC
  )

  INSERT INTO @TEMP_TABLE ( ID, CLASS,     NAME, AGE )
                      SELECT 1,   'A',   'ERIC',  15
                UNION SELECT 2,   'A', 'STEVEN',  15
                UNION SELECT 3,   'A',   'JOHN',  15
                UNION SELECT 4,   'B',  'JERRY',  15
                UNION SELECT 5,   'B',   'NICK',  15
                UNION SELECT 6,   'B',    'TOM',  15

  SELECT *
       , RANK() OVER ( ORDER BY AGE )
      AS AGE_RANK
       , ROW_NUMBER() OVER ( ORDER BY AGE )
      AS AGE_ROW_NUMBER
    FROM @TEMP_TABLE
/*
[ID][CLASS] [NAME]  [AGE][AGE_RANK][AGE_ROW_NUMBER]
  1    A     ERIC    15       1           1
  2    A     JOHN    17       2           2
  3    A     JERRY   17       2           3
  4    B     NICK    17       2           4
  5    B     TOM     18       5           5
  6    B     STEVEN  20       6           6
*/
    
  SELECT *
       , RANK() OVER ( PARTITION BY CLASS ORDER BY AGE )
      AS AGE_RANK
       , ROW_NUMBER() OVER ( PARTITION BY CLASS ORDER BY AGE )
      AS AGE_ROW_NUMBER
    FROM @TEMP_TABLE

/*
[ID][CLASS] [NAME]  [AGE][AGE_RANK][AGE_ROW_NUMBER]
  1    A     ERIC    15       1           1
  2    A     JOHN    17       2           2
  3    A     JERRY   17       3           3
  4    B     NICK    17       1           1
  5    B     TOM     18       1           2
  6    B     STEVEN  20       3           3
*/
    
=>       RANK : equal value -> equal rank
   ROW_NUMBER : equal value -> diff rank
