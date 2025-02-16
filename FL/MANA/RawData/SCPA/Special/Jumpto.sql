".open '/home/vncwmk3/TerrData86777/FL/SARA/DB-Dev/TerrIDData.db'"
. \nJumpto.sql-out-of-date-exiting\n
.exit 1     -- Jumpto.sql out of-date
"DROP TABLE IF EXISTS Defs400;"
"CREATE TABLE ""Defs400""(newtid TEXT, newdb TEXT, newsql TEXT);"
".mode csv"
".headers OFF"
".separator |"
".import '/home/vncwmk3/TerrData86777/FL/SARA/RawData/SCPA/SCPA-Downloads/Terr400/segdefs.csv' Defs400"
"UPDATE Defs400"
"SET dbName = dbname || '_@@-zz'"
"WHERE dbName IS 'SCPA';"
.quit
