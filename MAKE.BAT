@ECHO OFF

SET VERSION=8.2-BETA
SET BUILDDATE=%date:~8,2%%date:~5,2%%date:~2,2%

SET FILENAME=MM_MurderMystery_v%VERSION%_dev%BUILDDATE%

IF EXIST %FILENAME%.PK3 DEL %FILENAME%.PK3
ECHO Making %FILENAME%.pk3
ECHO Please wait...
ECHO.
IF EXIST R:\ (
    .\TOOLS\7ZA.EXE u R:\%FILENAME%.pk3 .\SRC\* -tzip
) ELSE (
    .\TOOLS\7ZA.EXE u .\%FILENAME%.pk3 .\SRC\* -tzip
)
ECHO.
ECHO Finished making %FILENAME%.pk3 !