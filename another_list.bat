@echo off
setlocal enabledelayedexpansion

:: Define the directory to list
set "directory=C:\plam\palmistry"

:: Check if the directory exists
if not exist "%directory%" (
    echo The system cannot find the path specified.
    pause
    exit /b
)

:: List files excluding README.md
echo Listing files excluding README.md:
for /f "delims=" %%I in ('dir /b /s /a-d "%directory%" ^| findstr /v /i /c:"README.md"') do (
    echo %%I
)

:: List directories
echo Listing directories:
for /f "delims=" %%I in ('dir /b /s /ad "%directory%"') do (
    echo %%I
)

echo.
echo Listing contents of .py and .ipynb files:
echo.

:: Display the contents of all .py and .ipynb files
for /r "%directory%" %%I in (*.py *.ipynb) do (
    echo -------------------------
    echo File: %%I
    echo -------------------------
    type "%%I"
    echo.
)

echo Listing complete.
endlocal
pause
