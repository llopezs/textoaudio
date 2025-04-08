@echo off
echo ===== GitHub Repository Setup Script =====
echo.

REM Check if Git is installed
git --version > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Git is not installed or not in your PATH. Please install Git first.
    echo Download from: https://git-scm.com/downloads
    exit /b 1
)

echo This script will help you set up your GitHub repository with a Personal Access Token.
echo Please make sure you have created a Personal Access Token as described in github_pat_guide.md
echo.

set /p GITHUB_USERNAME=Enter your GitHub username: 
set /p REPO_NAME=Enter the repository name (default: textotoaudio): 

if "%REPO_NAME%"=="" set REPO_NAME=textoaudio

echo.
echo IMPORTANT: Your Personal Access Token will be used for GitHub authentication.
echo The token will NOT be stored in this script or committed to your repository.
echo.
set /p GITHUB_PAT=Enter your GitHub Personal Access Token: 

echo.
echo Initializing Git repository...

REM Initialize Git repository if not already initialized
if not exist .git (
    git init
    echo Git repository initialized.
) else (
    echo Git repository already exists.
)

echo.
echo Adding files to Git...
git add .

echo.
echo Committing files...
git commit -m "Initial commit of text-to-audio converter"

echo.
echo Setting up remote repository...
git remote remove origin 2>nul
git remote add origin https://%GITHUB_USERNAME%:%GITHUB_PAT%@github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo.
echo Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===== Success! =====
    echo Your repository has been successfully pushed to GitHub.
    echo Repository URL: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
    echo.
    echo Note: For security, your Personal Access Token was only used for this session
    echo and was not stored permanently.
) else (
    echo.
    echo ===== Error =====
    echo There was an issue pushing to GitHub. Please check:
    echo 1. Your GitHub username and Personal Access Token are correct
    echo 2. The repository name is valid and doesn't already exist
    echo 3. You have internet connectivity
    echo.
    echo For more help, refer to github_pat_guide.md
)

echo.
echo Press any key to exit...
pause > nul