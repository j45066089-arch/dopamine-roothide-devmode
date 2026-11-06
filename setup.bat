@echo off
REM Dopamine roothide DevMode Fix - Setup Script
REM ==============================================

echo.
echo ========================================
echo Dopamine roothide - DeveloperMode Fix
echo ========================================
echo.

REM Check if gh CLI is installed
where gh >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] GitHub CLI (gh) not found!
    echo Install: winget install GitHub.cli
    pause
    exit /b 1
)

echo [1/4] Creating GitHub repo...
gh repo create dopamine-roothide-devmode --public --source=. --push --description "Dopamine roothide with DeveloperMode fix for Revolut"
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to create repo. It might already exist.
    echo Manually create: https://github.com/new?name=dopamine-roothide-devmode
    pause
)

echo.
echo [2/4] Repo created!
echo URL: https://github.com/%USERNAME%/dopamine-roothide-devmode
echo.

echo [3/4] Opening GitHub Actions...
start https://github.com/%USERNAME%/dopamine-roothide-devmode/actions

echo.
echo [4/4] Instructions:
echo 1. Go to Actions tab
echo 2. Click "Build Dopamine roothide (DeveloperMode Patch)"
echo 3. Click "Run workflow"
echo 4. Wait 5-10 minutes
echo 5. Download Dopamine-TIPA artifact
echo.
echo ========================================
echo Done! Check GitHub for build status.
echo ========================================
pause
