@echo off
setlocal enabledelayedexpansion
set /p foldername="Enter project name: "

echo You entered: %foldername%

if exist "%foldername%" (
    echo Error: The folder "%foldername%" already exists.
    pause
    exit /b
)

mkdir "%foldername%"
if errorlevel 1 (
    echo Error: Failed to create the folder.
    pause
    exit /b
)

cd "%foldername%"
if errorlevel 1 (
    echo Error: Failed to change to the folder.
    pause
    exit /b
)

(
echo {
echo    "manifest_version": 3,
echo    "name": "Your Extension Name",
echo    "version": "1.0",
echo    "description": "A Chrome extension",
echo    "action": {
echo        "default_popup": "popup.html",
echo        "default_icon": "assets/icon.png"
echo    },
echo    "background": {
echo        "service_worker": "js/service_worker.js"
echo    },
echo    "content_scripts": [
echo        {
echo            "matches": ["<all_urls>"],
echo            "js": ["js/content_scripts/content.js"],
echo            "css": ["styles/styles.scss"]
echo        }
echo    ],
echo    "permissions": [
echo        "storage"
echo    ]
echo }
) > manifest.json

echo ^<html^>^<body^>Popup content^</body^>^</html^> > popup.html

mkdir src
mkdir src\assets
echo // Example icon file > src\assets\icon.png

mkdir src\styles
mkdir src\styles\components
mkdir src\styles\utils
mkdir src\js
mkdir src\js\helpers
mkdir src\js\content_scripts

echo // SCSS for components > src\styles\components\_index.scss
echo // SCSS for utilities > src\styles\utils\_index.scss
echo // Main styles file > src\styles\styles.scss
echo // JavaScript code for service worker > src\js\service_worker.js
echo // Helper functions > src\js\helpers\helpers.js
echo // Content script > src\js\content_scripts\content.js

echo Project structure created successfully!
pause
