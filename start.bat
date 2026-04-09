@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║                                                           ║
echo ║   ViperPay - Bills                                        ║
echo ║   Professionelle Rechnungssoftware                        ║
echo ║                                                           ║
╚═══════════════════════════════════════════════════════════╝
echo.

:: Check Docker
where docker >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Docker ist nicht installiert!
    echo         Bitte installieren Sie Docker Desktop: https://docs.docker.com/get-docker/
    pause
    exit /b 1
)

echo [OK] Docker gefunden
echo.

set ACTION=%1
if \"%ACTION%\"==\"\" set ACTION=up

if \"%ACTION%\"==\"up\" goto :start
if \"%ACTION%\"==\"start\" goto :start
if \"%ACTION%\"==\"stop\" goto :stop
if \"%ACTION%\"==\"down\" goto :stop
if \"%ACTION%\"==\"restart\" goto :restart
if \"%ACTION%\"==\"logs\" goto :logs
if \"%ACTION%\"==\"clean\" goto :clean
if \"%ACTION%\"==\"status\" goto :status
goto :help

:start
echo [INFO] Starte ViperPay...
docker compose up -d --build
echo.
echo [OK] ViperPay wurde erfolgreich gestartet!
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    App oeffnen:      http://localhost
echo.
echo    Demo Account:     demo@viperpay.de
echo    Demo Passwort:    demo2024
echo.
echo    Admin Account:    admin@example.com
echo    Admin Passwort:   admin123
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
goto :end

:stop
echo [INFO] Stoppe ViperPay...
docker compose down
echo [OK] ViperPay wurde gestoppt.
goto :end

:restart
echo [INFO] Starte ViperPay neu...
docker compose down
docker compose up -d --build
echo [OK] ViperPay wurde neu gestartet.
goto :end

:logs
echo [INFO] Zeige Logs...
docker compose logs -f
goto :end

:clean
echo [INFO] Loesche alle Container und Daten...
docker compose down -v --rmi all
echo [OK] Alles wurde geloescht.
goto :end

:status
echo [INFO] Status:
docker compose ps
goto :end

:help
echo Verwendung: start.bat [up^|stop^|restart^|logs^|clean^|status]
echo.
echo   up/start  - Starte ViperPay (Standard)
echo   stop      - Stoppe ViperPay
echo   restart   - Starte ViperPay neu
echo   logs      - Zeige Live-Logs
echo   clean     - Loesche alle Container und Daten
echo   status    - Zeige Container-Status
goto :end

:end
echo.
pause
