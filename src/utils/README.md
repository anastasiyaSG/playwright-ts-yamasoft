# 🔧 Utility Functions

This directory contains helper functions and utilities used across the test suite.

## Files

### 📋 constants.ts
Centralized constants for test configuration.

**Exports:**
```typescript
TIMEOUTS = {
  PAGE_LOAD: 10_000,    // Page navigation timeout
  EXPECT: 5_000,        // Assertion timeout
  OVERLAY: 3_000,       // Overlay dismissal timeout
  DEFAULT: 7_000,       // Default wait time
}

TEST_DATA = {
  BROOKLYN_TRIP_HEADING: 'Brooklyn Trip',
  PLACES_HEADING: 'Do you have any places you',
  PLANNING_TEXT: 'Start planning your route. If',
}
```

### 📊 logger.ts
Timestamp-prefixed logging utility.

**Usage:**
```typescript
import { logger } from './utils/logger';

logger.info('Test started');      // [HH:MM:SS] [INFO] Test started
logger.debug('Debug info');       // [HH:MM:SS] [DEBUG] Debug info
logger.warn('Warning message');   // [HH:MM:SS] [WARN] Warning message
logger.error('Error occurred');   // [HH:MM:SS] [ERROR] Error occurred
```

### 🎭 overlayHandler.ts
Dismisses blocking overlays that interfere with tests.

**Handles:**
- Gist embed overlay (JavaScript removal)
- Marketing offer popup (iframe close button)
- Cookie consent banner

**Export:**
```typescript
export async function dismissAllOverlays(page: Page): Promise<void>
```

**Usage:**
```typescript
await dismissAllOverlays(page);  // Dismiss all known overlays
```

### ✈️ tripHelpers.ts
Reusable trip creation workflows and utilities.

**Functions:**

| Function | Purpose |
|----------|---------|
| `startTrip()` | Click "Start Trip" and verify form appears |
| `fillAndCreateTrip()` | Fill form and click "Create trip" |
| `addMassachusettsStop()` | Add Massachusetts as a trip stop |
| `safeDeleteTrip()` | Delete trip without throwing errors |

**Usage:**
```typescript
import { 
  startTrip, 
  fillAndCreateTrip, 
  safeDeleteTrip 
} from './utils/tripHelpers';

test('create and delete trip', async ({ page, tripCreationPage }) => {
  await startTrip(page, tripCreationPage);
  await fillAndCreateTrip(tripCreationPage);
  // ... test assertions ...
  await safeDeleteTrip(page);
});
```

---

## Import Paths

```typescript
// Import from utils
import { TIMEOUTS, TEST_DATA } from '../utils/constants';
import { logger } from '../utils/logger';
import { dismissAllOverlays } from '../utils/overlayHandler';
import { safeDeleteTrip, startTrip } from '../utils/tripHelpers';
```

---

## Adding New Utilities

When adding new utility functions:

1. **Keep functions focused** - One responsibility per function
2. **Type everything** - Use TypeScript for type safety
3. **Export clearly** - Named exports for tree-shaking
4. **Document usage** - Add JSDoc comments
5. **Handle errors** - Use try-catch with meaningful messages

---

## Performance Tips

- Use `TIMEOUTS.DEFAULT` for most waits
- Use `TIMEOUTS.PAGE_LOAD` for navigation
- Use `TIMEOUTS.OVERLAY` for quick overlay checks
- Avoid hardcoding timeouts in individual tests

