-- * set RecordType fields.
. \nSetRecType.sql-out-of-date-exiting\n
.exit 1     -- SetRecType.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
WITH a AS (SELECT Code, RType FROM SCPropUse)
UPDATE Spec_RUBridge
SET RecordDate = RecordType =
CASE 
WHEN PropUse IN (SELECT Code FROM a)
 THEN (SELECT RType FROM a 
   WHERE Code IS PropUse)
ELSE RecordType
END;

--deletetoEnd;

