# 📚 Source Code Structure

```
src/
├── 📄 fixtures.ts              ← Custom Playwright fixtures
├── 📁 pages/                   ← Page Object Models
│   ├── LoginPage.ts            ← Login & authentication
│   ├── MyTripsPage.ts          ← Trip list & management
│   ├── TripCreationPage.ts     ← Trip creation form
│   └── README.md               ← Pages documentation
└── 📁 utils/                   ← Helper utilities
    ├── constants.ts            ← Timeouts & test data
    ├── logger.ts               ← Timestamp logging
    ├── overlayHandler.ts       ← Overlay dismissal
    ├── tripHelpers.ts          ← Trip workflows
    └── README.md               ← Utils documentation
```

## 📋 Quick Navigation

- **[fixtures.ts](fixtures.ts)** - Custom test fixtures with pre-configured page objects
- **[pages/README.md](pages/README.md)** - Page Object Model documentation
- **[utils/README.md](utils/README.md)** - Utility functions documentation

## 🚀 Getting Started

1. **Use the fixtures:**
   ```typescript
   import { test, expect } from '../src/fixtures';
   
   test('my test', async ({ authenticatedPage, tripCreationPage }) => {
     // authenticatedPage is already logged in!
   });
   ```

2. **Import utilities:**
   ```typescript
   import { dismissAllOverlays } from '../src/utils/overlayHandler';
   import { TIMEOUTS, TEST_DATA } from '../src/utils/constants';
   ```

3. **Create new page objects:**
   - Extend from existing POMs
   - Use semantic locators only
   - Add clear method names

