#!/bin/bash

# Project Manager - Development Startup Script

echo "🚀 Starting Project Manager in development mode..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if MySQL is running (basic check)
if ! command -v mysql &> /dev/null; then
    echo "⚠️  MySQL command not found. Make sure MySQL is installed and running."
fi

# Install backend dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    npm install
fi

# Install frontend dependencies if node_modules doesn't exist
if [ ! -d "client/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd client
    npm install
    cd ..
fi

# Check if config.env exists
if [ ! -f "config.env" ]; then
    echo "❌ config.env file not found. Please create it with your database configuration."
    echo "Example:"
    echo "DB_HOST=localhost"
    echo "DB_USER=your_username"
    echo "DB_PASSWORD=your_password"
    echo "DB_NAME=project_manager"
    echo "DB_PORT=3306"
    echo "JWT_SECRET=your_secret_key"
    echo "PORT=5000"
    exit 1
fi

echo "✅ Dependencies installed and configuration checked."

# Start backend server in background
echo "🔧 Starting backend server on port 5000..."
npm run dev &
BACKEND_PID=$!

# Wait a moment for backend to start
sleep 3

# Start frontend server
echo "🎨 Starting frontend server on port 3000..."
cd client
npm start &
FRONTEND_PID=$!

echo "✅ Both servers are starting..."
echo "📱 Frontend: http://localhost:3000"
echo "🔧 Backend: http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop both servers"

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping servers..."
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    exit 0
}

# Trap Ctrl+C and call cleanup
trap cleanup SIGINT

# Wait for both processes
wait 