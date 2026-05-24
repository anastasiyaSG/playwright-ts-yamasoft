# 📄 Page Object Models

This directory contains all Page Object Model (POM) classes for the Roadtrippers application.

## Files

### 🔓 LoginPage.ts
Handles user authentication and login interactions.

**Locators:**
- `loginButton` - Main "Log in" link
- `loginPopupHeadline` - Modal heading verification
- `username` - Username input field
- `password` - Password input field
- `submitButton` - Login submit button

**Methods:**
- `login(username, password)` - Fill and submit login form

### 🗺️ MyTripsPage.ts
Manages trip list and trip deletion flows.

**Locators:**
- `myTripsButton` - "My trips" navigation button
- `seeAllTripsButton` - "See all trips" link
- `tripDetails` - Trip menu button
- `deleteTripButton` - Delete trip action
- `deleteTripPopUp` - Delete confirmation button

**Methods:**
- `deleteTrip()` - Complete trip deletion workflow

### ✈️ TripCreationPage.ts
Handles the entire trip creation form and interactions.

**Locators:**
- `startTrip` - "Start Trip" button
- `whereAreYouGoingHeading` - Form heading
- `startingPointInput` - Starting location field
- `destinationInput` - Destination field
- `createTripButton` - Create trip submission
- `launchTripButton` - Launch trip action
- `calendarStartInput` - Date picker
- `calendarDay10` - Calendar day selection
- `addStopsInput` - Additional stops field
- `exploreTrip` - "Start exploring" button

**Methods:**
- `fillTripDetails()` - Complete trip form with Arizona → Brooklyn

---

## Usage Example

```typescript
import { TripCreationPage } from './pages/TripCreationPage';

test('create trip', async ({ page }) => {
  const tripPage = new TripCreationPage(page);
  await tripPage.fillTripDetails();
  await tripPage.createTripButton.click();
});
```

---

## Locator Strategy

All pages use semantic locators for maximum resilience:
- ✅ `getByRole()` - Most accessible and stable
- ✅ `getByText()` - For visible content
- ⚠️ CSS selectors - Only as fallback

---

## Best Practices

1. **Atomic Methods** - Each method handles one logical action
2. **Clear Naming** - Method names describe the action
3. **Auto-Waiting** - Let Playwright wait for visibility
4. **No Sleep** - Never use `await page.waitForTimeout()`
5. **Error Handling** - Meaningful error messages in constructors

