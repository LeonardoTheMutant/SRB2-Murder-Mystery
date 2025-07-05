@ECHO OFF

SET VERSION=1.3
For /F %%A In ('WMIC OS Get LocalDateTime') Do If Not "%%~xA"=="" Set "ds=%%~nA"
SET BUILDDATE=%ds:~,-6%

IF EXIST R:\ (
	SET BUILDDIR=R:
) ELSE (
	SET BUILDDIR=.
)

SET FILENAME=MM_LTMs_MurderMystery_v%VERSION%_dev%BUILDDATE%

ECHO Making %FILENAME%.pk3
ECHO Please wait...
ECHO.

IF EXIST %BUILDDIR%\%FILENAME%.pk3 ( DEL %BUILDDIR%\%FILENAME%.pk3 )
.\TOOLS\7ZA.EXE a %BUILDDIR%\%FILENAME%.pk3 .\SRC\* -tzip

ECHO.
ECHO Finished making %BUILDDIR%\%FILENAME%.pk3 !
