@echo off
cd /d "C:\Users\anast\OneDrive\Documents\yamasoft_qa_assesment-1.worktrees\agents-playwright-typescript-test-expansion\playwright-ts-yamasoft"
(
echo BASE_URL=https://maps.roadtrippers.com
echo USERNAME=qa_yamasoft_assesment
echo PASSWORD=pCvw5t73YUFY!B2
) > .env
echo .env file created
type .env
echo.
echo Running npm install...
call npm install
echo.
echo Installing Playwright browsers...
call npx playwright install chromium firefox webkit
echo.
echo Running tests...
call npm test
