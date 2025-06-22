@echo off
REM Project Manager - Development Startup Script for Windows

echo 🚀 Starting Project Manager in development mode...

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

REM Install backend dependencies if node_modules doesn't exist
if not exist "node_modules" (
    echo 📦 Installing backend dependencies...
    npm install
)

REM Install frontend dependencies if node_modules doesn't exist
if not exist "client\node_modules" (
    echo 📦 Installing frontend dependencies...
    cd client
    npm install
    cd ..
)

REM Check if config.env exists
if not exist "config.env" (
    echo ❌ config.env file not found. Please create it with your database configuration.
    echo Example:
    echo DB_HOST=localhost
    echo DB_USER=your_username
    echo DB_PASSWORD=your_password
    echo DB_NAME=project_manager
    echo DB_PORT=3306
    echo JWT_SECRET=your_secret_key
    echo PORT=5000
    pause
    exit /b 1
)

echo ✅ Dependencies installed and configuration checked.

REM Start backend server
echo 🔧 Starting backend server on port 5000...
start "Backend Server" cmd /k "npm run dev"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

REM Start frontend server
echo 🎨 Starting frontend server on port 3000...
cd client
start "Frontend Server" cmd /k "npm start"
cd ..

echo ✅ Both servers are starting...
echo 📱 Frontend: http://localhost:3000
echo 🔧 Backend: http://localhost:5000
echo.
echo Press any key to close this window (servers will continue running)
pause >nul 