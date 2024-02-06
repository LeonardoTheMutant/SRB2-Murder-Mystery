@ECHO OFF

SET VERSION=10.1-BETA
SET BUILDDATE=%date:~8,2%%date:~5,2%%date:~2,2%

SET FILENAME=MM_MurderMystery_v%VERSION%_dev%BUILDDATE%

ECHO Making %FILENAME%.pk3
ECHO Please wait...
ECHO.
IF EXIST R:\ (
    IF EXIST R:\%FILENAME%.pk3 ( DEL R:\%FILENAME%.pk3 )
    .\TOOLS\7ZA.EXE a R:\%FILENAME%.pk3 .\SRC\* -tzip
) ELSE (
    IF EXIST .\%FILENAME%.pk3 ( DEL .\%FILENAME%.pk3 )
    .\TOOLS\7ZA.EXE a .\%FILENAME%.pk3 .\SRC\* -tzip
)
ECHO.
ECHO Finished making %FILENAME%.pk3 !