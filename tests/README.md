# 🧪 Test Suites

This directory contains all test specification files for the Roadtrippers application.

## 📁 Files

### 🟢 trip-creation.spec.ts
**Core smoke tests** covering essential trip creation functionality.

**Tests (4):**

| Test | Category | Coverage |
|------|----------|----------|
| Guest creates a trip and launches it | Smoke | Guest user flow, trip launch |
| Authenticated user creates trip, launches it, verifies persistence | Smoke | Auth login, trip persistence |
| Authenticated user creates trip with stops, verifies persistence | Smoke | Multi-stop trips, persistence |
| Form validation: cannot create trip without destination | Validation | Form error handling |

**Key Features:**
- ✅ Tests guest users (no login required)
- ✅ Tests authenticated users
- ✅ Verifies trip persistence in "My Trips"
- ✅ Tests form validation logic
- ✅ Automatic overlay dismissal
- ✅ Automatic trip cleanup

### 🟡 trip-creation-expanded.spec.ts
**Extended test scenarios** for edge cases and additional coverage.

**Tests (4):**

| Test | Category | Coverage |
|------|----------|----------|
| Invalid starting point - form rejects gibberish | Validation | Input validation |
| Empty trip creation - only date, no stops | Edge Case | Minimal valid trip |
| Trip deletion confirmation dialog appears and functions | User Flow | Delete workflow |
| Trip persistence after browser refresh | Persistence | Session handling |

**Key Features:**
- ✅ Form validation with invalid inputs
- ✅ Minimal viable trips
- ✅ Deletion workflows
- ✅ Browser refresh resilience
- ✅ Session persistence

---

## 🏃 Running Tests

```bash
# Run all tests
npm test

# Run core tests only
npm test tests/trip-creation.spec.ts

# Run expanded tests only
npm test tests/trip-creation-expanded.spec.ts

# Run with pattern matching
npm test -- --grep "Guest"
npm test -- --grep "validation"

# Run with custom configuration
npm test -- --headed                # See browser
npm test -- --workers=1              # Single worker
npm test -- --timeout=60000           # Custom timeout
```

---

## 📊 Test Structure

Each test follows this pattern:

```typescript
import { expect } from '@playwright/test';
import { test } from '../src/fixtures';

test.describe('Feature Group', () => {
  test('descriptive test name', async ({ page, fixture1, fixture2 }) => {
    // Setup
    logger.info('Test started: descriptive message');
    
    // Action
    await someAction();
    
    // Assert
    await expect(element).toBeVisible();
    
    // Cleanup
    await cleanup();
    
    logger.info('Test passed: descriptive message');
  });
});
```

---

## 🔧 Available Fixtures

### `page`
Standard Playwright page object for general interactions.

### `loginPage`
Pre-instantiated LoginPage POM.

### `myTripsPage`
Pre-instantiated MyTripsPage POM.

### `tripCreationPage`
Pre-instantiated TripCreationPage POM.

### `authenticatedPage`
Pre-configured authenticated page:
- ✅ Logged in with test credentials
- ✅ Overlays dismissed
- ✅ Ready for authenticated tests
- ✅ Automatic stale trip cleanup

---

## 📝 Test Data

All test data is centralized in `src/utils/constants.ts`:

```typescript
TEST_DATA = {
  BROOKLYN_TRIP_HEADING: 'Brooklyn Trip',
  PLACES_HEADING: 'Do you have any places you',
  PLANNING_TEXT: 'Start planning your route. If',
}
```

---

## ✅ Best Practices

1. **Descriptive Names** - Test name should explain what's being tested
2. **Single Responsibility** - Each test focuses on one feature
3. **Clear Assertions** - Use explicit `expect()` statements
4. **Proper Cleanup** - Always delete created trips
5. **Logging** - Log test start/end for debugging
6. **No Hardcoded Data** - Use constants for test data
7. **Timeouts** - Use predefined `TIMEOUTS` constants

---

## 🐛 Debugging Tests

```bash
# Debug mode with DevTools
npm run test:debug

# Interactive UI mode
npm run test:ui

# Headed mode to see browser
npm run test:headed

# Generate element locators
npx playwright codegen https://maps.roadtrippers.com
```

---

## 📈 Test Metrics

- **Total Tests:** 8
- **Pass Rate Target:** 100%
- **Average Duration:** ~3-5 minutes per test
- **Platforms:** Chromium, Firefox, WebKit

---

## 🚀 Future Test Scenarios

- [ ] Multiple concurrent trips
- [ ] Trip search and filtering
- [ ] Trip editing after creation
- [ ] Special characters in trip details
- [ ] Very long trip names
- [ ] Past and future date handling
- [ ] API integration tests
- [ ] Performance benchmarks

