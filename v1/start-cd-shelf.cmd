@echo off
title CD Shelf
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
    set "PYTHON_CMD=py"
) else (
    where python >nul 2>nul
    if errorlevel 1 (
        echo Python could not be found.
        echo Install Python, then run this file again.
        pause
        exit /b 1
    )
    set "PYTHON_CMD=python"
)

echo Starting CD Shelf at http://127.0.0.1:5173/
start "" /b powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 1; Start-Process 'http://127.0.0.1:5173/'"
%PYTHON_CMD% -m http.server 5173 --bind 127.0.0.1

echo.
echo CD Shelf has stopped.
pause
