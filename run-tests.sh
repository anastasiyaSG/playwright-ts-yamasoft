#!/usr/bin/env bash

# Roadtrippers Playwright TypeScript - Test Execution Guide
# This script prepares and runs the test suite against the live Roadtrippers site

set -e

echo "🚀 Roadtrippers Test Suite - Execution Setup"
echo "=============================================="

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16+ from https://nodejs.org"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"

# Navigate to project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

echo "📁 Project directory: $PROJECT_DIR"

# Check for .env file
if [ ! -f ".env" ]; then
    echo "❌ .env file not found!"
    echo "📝 Creating .env from .env.example..."
    cp .env.example .env
    echo "⚠️  Please update .env with your credentials:"
    echo "   BASE_URL=https://maps.roadtrippers.com"
    echo "   USERNAME=your_username"
    echo "   PASSWORD=your_password"
    exit 1
fi

echo "✅ .env file found"

# Verify environment variables
if grep -q "your_test_username" .env; then
    echo "❌ .env still contains placeholder values!"
    echo "   Please update USERNAME and PASSWORD in .env file"
    exit 1
fi

echo "✅ Environment variables configured"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Install browsers
echo ""
echo "🌐 Installing Playwright browsers..."
npx playwright install chromium firefox webkit

# Run tests
echo ""
echo "🧪 Running test suite..."
echo "=============================================="

npm test

echo ""
echo "✅ Test execution complete"
