# 🎭 Roadtrippers Playwright TypeScript Test Automation

<div align="center">

[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Playwright](https://img.shields.io/badge/Playwright-1.40-green?logo=playwright)](https://playwright.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-16+-brightgreen?logo=node.js)](https://nodejs.org/)
[![Tests Passing](https://img.shields.io/badge/Tests-8%20Passing-brightgreen)](tests/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**A comprehensive TypeScript + Playwright test automation suite for [Roadtrippers](https://maps.roadtrippers.com) trip planning application**

[Features](#-features) • [Quick Start](#-quick-start) • [Test Coverage](#-test-coverage) • [Project Structure](#-project-structure) • [Debugging](#-debugging)

</div>

---

## ✨ Features

| Feature | Details |
|---------|---------|
| 🏗️ **Page Object Model** | Clean, semantic locators using `getByRole()`, `getByText()` |
| 🔐 **Custom Fixtures** | Pre-configured authenticated & guest user setups |
| 🎯 **Overlay Handling** | Automatic dismissal of gist embeds, popups, cookie banners |
| ⚡ **Zero Sleep Calls** | Pure Playwright auto-waiting with explicit assertions |
| 🌐 **Multi-Browser** | Chromium, Firefox, and WebKit support |
| 📊 **HTML Reporting** | Beautiful test reports with pass/fail details |
| 🔍 **Comprehensive Logging** | Timestamp-prefixed console output for debugging |
| 🚀 **CI/CD Ready** | Pre-configured for GitHub Actions and automated runs |

---

## 📊 Test Coverage

### 🟢 Smoke Tests (4 tests)
- ✅ Guest trip creation and launch
- ✅ Authenticated user trip creation with persistence
- ✅ Authenticated user trip creation with stops
- ✅ Form validation — missing destination rejection

### 🟡 Expanded Tests (4 tests)
- ✅ Invalid starting point validation
- ✅ Empty trip creation (no additional stops)
- ✅ Trip deletion with confirmation dialog
- ✅ Trip persistence after browser refresh

**Total Coverage: 8 comprehensive end-to-end tests**

---

## 🚀 Quick Start

### Prerequisites

```bash
# Check Node.js version (16+ required)
node --version
```

### Installation

```bash
# 1️⃣ Clone the repository
git clone https://github.com/anastasiyaSG/playwright-ts-yamasoft.git
cd playwright-ts-yamasoft

# 2️⃣ Install dependencies
npm install

# 3️⃣ Install Playwright browsers
npx playwright install

# 4️⃣ Create environment file
cp .env.example .env

# 5️⃣ Edit .env with your test credentials
# BASE_URL=https://maps.roadtrippers.com
# USERNAME=your_test_username
# PASSWORD=your_test_password
```

### Running Tests

```bash
# Run all tests
npm test

# Run with browser visible (headed mode)
npm run test:headed

# Run with interactive UI
npm run test:ui

# Run in debug mode with DevTools
npm run test:debug

# Run specific test file
npm test tests/trip-creation.spec.ts

# Run tests matching a pattern
npm test -- --grep "Guest"

# Run with custom number of workers
npm test -- --workers=2
```

### View Reports

```bash
# Open HTML test report
npm run test:report
```

---

## 📁 Project Structure

```
playwright-ts-yamasoft/
├── 📄 src/
│   ├── 📁 pages/                    # Page Object Models
│   │   ├── LoginPage.ts             # Login flow & authentication
│   │   ├── MyTripsPage.ts           # Trip list & management
│   │   └── TripCreationPage.ts      # Trip creation form
│   ├── 📁 utils/                    # Utilities & Helpers
│   │   ├── constants.ts             # Timeouts, test data, paths
│   │   ├── logger.ts                # Timestamp-prefixed logging
│   │   ├── overlayHandler.ts        # Overlay dismissal logic
│   │   └── tripHelpers.ts           # Reusable trip workflows
│   └── fixtures.ts                  # Custom Playwright fixtures
├── 📁 tests/
│   ├── trip-creation.spec.ts        # Core smoke tests
│   └── trip-creation-expanded.spec.ts # Extended scenarios
├── playwright.config.ts             # Playwright configuration
├── tsconfig.json                    # TypeScript configuration
├── package.json                     # Dependencies & scripts
├── .env.example                     # Environment template
├── .gitignore                       # Git ignore rules
└── README.md                        # This file
```

---

## 🔧 Environment Configuration

Create a `.env` file in the project root:

```ini
# Application URL
BASE_URL=https://maps.roadtrippers.com

# Test Account Credentials
USERNAME=your_test_username
PASSWORD=your_test_password

# CI/CD Flag (automatically set by GitHub Actions)
# CI=true
```

**Note:** Never commit `.env` files with real credentials to version control. Use `.env.example` as a template.

---

## 🏗️ Architecture

### Page Object Model

Each page is represented as a TypeScript class with semantic locators:

```typescript
// ✅ Semantic locators (preferred)
this.loginButton = page.getByRole('link', { name: 'Log in' });
this.destinationInput = page.getByRole('textbox', { name: 'Destination' });

// ✅ Text-based locators
this.seeAllTripsButton = page.getByRole('link', { name: 'See all trips' });

// ⚠️ CSS selectors (fallback only)
this.tripDetails = page.locator('.list > section > .rt-menu > .rt-button');
```

### Custom Fixtures

Pre-configured fixtures extend Playwright's base test:

```typescript
import { test, expect } from '@fixtures';

test('my test', async ({ page, loginPage, authenticatedPage }) => {
  // page - regular Playwright page
  // loginPage - pre-instantiated LoginPage POM
  // authenticatedPage - already logged in & overlays dismissed
});
```

### Utilities

| File | Purpose |
|------|---------|
| `constants.ts` | Timeouts, test data constants, URL paths |
| `logger.ts` | Formatted console logging with timestamps |
| `overlayHandler.ts` | Dismiss gist embeds, marketing popups, cookie banners |
| `tripHelpers.ts` | Reusable trip creation & management workflows |

---

## 🐛 Debugging

### Interactive UI Mode

```bash
npm run test:ui
```

- Step through tests visually
- Inspect elements on the page
- View DOM snapshots at each step
- Modify locators in real-time

### Debug Mode

```bash
npm run test:debug
```

- Opens DevTools automatically
- Pauses on first line of test
- Inspect page state during execution

### Element Inspection

```bash
# Generate locators interactively
npx playwright codegen https://maps.roadtrippers.com
```

### View Playwright Traces

Test failures automatically capture traces:

```bash
npx playwright show-trace playwright-report/traces/<test-name>.zip
```

---

## 🔍 Locator Strategy

### Priority Order

1. **Semantic locators** (most resilient)
   ```typescript
   page.getByRole('button', { name: 'Click me' })
   page.getByLabel('Username')
   page.getByText('Visible text')
   ```

2. **Test IDs** (if available)
   ```typescript
   page.getByTestId('my-element')
   ```

3. **CSS selectors** (fallback)
   ```typescript
   page.locator('.button-class')
   ```

4. **XPath** (avoid when possible)

---

## 📋 Test Examples

### Basic Guest Test

```typescript
test('Guest creates a trip and launches it', async ({ page, tripCreationPage }) => {
  await page.goto('https://maps.roadtrippers.com');
  await tripCreationPage.startTrip.click();
  await tripCreationPage.fillTripDetails();
  await tripCreationPage.launchTripButton.click();
  
  await expect(page.getByRole('heading', { name: 'Brooklyn Trip' })).toBeVisible();
});
```

### Authenticated Test with Cleanup

```typescript
test('Authenticated user creates persistent trip', async ({ 
  authenticatedPage, 
  tripCreationPage, 
  myTripsPage 
}) => {
  const page = authenticatedPage; // Already logged in!
  
  await tripCreationPage.startTrip.click();
  await tripCreationPage.fillTripDetails();
  await tripCreationPage.launchTripButton.click();
  
  // Verify persistence
  await myTripsPage.myTripsButton.click();
  await expect(page.getByRole('heading', { name: 'Brooklyn Trip' })).toBeVisible();
  
  // Cleanup
  await safeDeleteTrip(page);
});
```

---

## 🚀 CI/CD Integration

This project is ready for GitHub Actions. Example workflow:

```yaml
name: Playwright Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm install
      - run: npx playwright install
      - run: npm test
        env:
          BASE_URL: ${{ secrets.BASE_URL }}
          USERNAME: ${{ secrets.TEST_USERNAME }}
          PASSWORD: ${{ secrets.TEST_PASSWORD }}
```

---

## 📚 Key Technologies

| Tool | Version | Purpose |
|------|---------|---------|
| **Playwright** | 1.40+ | Cross-browser automation |
| **TypeScript** | 5.3+ | Type-safe test code |
| **Node.js** | 16+ | JavaScript runtime |

---

## 🤝 Contributing

1. Create a feature branch: `git checkout -b feature/my-feature`
2. Make your changes and test locally: `npm test`
3. Commit with clear messages: `git commit -am 'Add my feature'`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📝 Code Style

- **TypeScript Strict Mode**: All files use strict typing
- **No Sleep Calls**: Use Playwright auto-waiting instead
- **Semantic Locators**: Prefer accessible, resilient selectors
- **Clear Naming**: Test names describe what is being tested
- **Comments**: Explain complex logic, not obvious code

---

## 🎓 Learning Resources

- [Playwright Documentation](https://playwright.dev/)
- [Playwright Best Practices](https://playwright.dev/docs/best-practices)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Page Object Model Pattern](https://playwright.dev/docs/pom)

---

## ⚠️ Known Limitations

- Tests run against **live production** site (no test environment)
- Requires **valid test account** credentials
- Trip data is **shared across tests** (cleanup via `safeDeleteTrip`)
- Some locators may become **brittle** if UI changes significantly

---

## 📋 Future Enhancements

| Priority | Enhancement | Benefits |
|----------|-------------|----------|
| 🔴 High | API test coverage | Test backend independently |
| 🔴 High | Visual regression testing | Catch UI layout issues early |
| 🟡 Medium | Performance benchmarks | Monitor page load times |
| 🟡 Medium | Accessibility testing | Ensure WCAG compliance |
| 🟢 Low | Load testing | Verify concurrent user capacity |

---

## 📞 Support & Issues

- 🐛 Found a bug? [Open an issue](../../issues/new)
- 💡 Have an idea? [Start a discussion](../../discussions/new)
- 📖 Need help? Check existing [issues](../../issues) and [documentation](#-learning-resources)

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ for quality test automation**

[![GitHub](https://img.shields.io/badge/GitHub-anastasiyaSG-black?logo=github)](https://github.com/anastasiyaSG)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/)

</div>
