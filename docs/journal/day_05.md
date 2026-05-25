# Day 5 Journal — go_router, Material 3 Theming, and Dark Mode

## Overview

Day 5 focused on improving the architecture of the Naija Wallet app by implementing go_router navigation, Material 3 theming, and persisted dark mode using Riverpod and SharedPreferences.

---

## What I Implemented

### Navigation with go_router

* Installed and configured `go_router`
* Created centralized routing in:

```text
lib/core/router/app_router.dart
```

* Replaced `Navigator.push()` with:

```dart
context.go()
context.push()
```

* Added routes for:

  * splash
  * login
  * register
  * home

---

### Auth Redirect Logic

* Created a temporary `AuthService`
* Added login, register, and logout methods
* Implemented route protection and redirects using go_router

---

### Material 3 Theming

* Added centralized themes:

```text
app_theme.dart
app_colors.dart
```

* Configured:

  * Light theme
  * Dark theme
  * Material 3
  * ThemeMode.system

---

### Persisted Dark Mode

* Integrated Riverpod and SharedPreferences
* Created a `themeProvider`
* Persisted theme state across app restarts

---

## Challenges Faced

### Gradle Lock Error

* Build failed because another Gradle/Java process locked the cache.
* Fixed by deleting the `.gradle` folder, running `flutter clean`, and restarting the build.

### Duplicate Theme Definitions

* Accidentally used two theme configurations in `MaterialApp.router`.
* Solved by removing the duplicate inline ThemeData.

### Riverpod Ref Error

* Tried using `ref.watch()` inside a StatelessWidget.
* Fixed by converting App into a `ConsumerWidget` and wrapping the app with `ProviderScope`.

---

## Key Lessons Learned

* Centralized navigation architecture using go_router
* Difference between `go()` and `push()`
* Material 3 theme management
* Riverpod state management
* Persisting app settings with SharedPreferences
* Better Git workflow and release tagging

---

## Deliverables Completed

* go_router integrated
* Auth redirects added
* Material 3 themes configured
* Dark mode persistence implemented
* Git tag created:

```text
v0.1.0-foundation
```

---

## Final Reflection

Day 5 improved my understanding of scalable Flutter architecture, especially navigation, theming, state management, and persistent app settings. The application now feels more production-ready and organized compared to previous days.
