# Day 4 Journal — Riverpod 2 Code Generation (Naija Wallet)

## Date

May 13, 2026

---

## What I worked on

Today I worked on implementing modern Riverpod 2 state management in my Naija Wallet Flutter project. I moved from basic state management concepts to a more advanced architecture using code generation with `@riverpod`, AsyncValue, and Notifier-based logic.

I built a simple counter application with two screens (Home and Details) where both screens share the same global state using a single Riverpod provider.

---

## What I achieved

* Set up Riverpod 2 with code generation (`riverpod_annotation` + `riverpod_generator`)
* Configured `build_runner` for automatic provider generation
* Built a shared counter state across two screens
* Implemented increment, decrement, and reset logic
* Learned how AsyncValue manages loading, data, and error states
* Understood how generated `.g.dart` files work

---

## Issues I ran into

### 1. Confusion with Riverpod code generation setup

At the beginning, I was confused about why multiple packages were needed (`riverpod_annotation`, `riverpod_generator`, and `build_runner`).

**Fix:**
I learned that Riverpod uses code generation to reduce boilerplate and automatically create provider logic using the `@riverpod` annotation.

I ran:

```bash
dart run build_runner watch
```

---

### 2. Generated files not appearing initially

Sometimes the `.g.dart` file did not show immediately.

**Fix:**

* Restarted VS Code
* Ran `flutter clean`
* Ran `flutter pub get`
* Ensured build_runner was actively running

---

### 3. Confusion about shared state between screens

At first, I thought I needed to pass data from HomePage to DetailsPage manually.

**Fix:**
I learned that both screens simply use:

```dart
ref.watch(counterProvider)
```

This allows both screens to automatically stay in sync.

---

### 4. Flutter run command mistake

I mistakenly ran:

```bash
flutter run -v output
```

which caused Flutter to look for a file called "output" and fail.

**Fix:**
I corrected it to:

```bash
flutter run -t lib/main_development.dart
```

I also learned that:

* `-v` is for verbose logs
* `-t` is for specifying the entry file

---

## What I learned

* How Riverpod 2 code generation works
* How to use `@riverpod` to generate providers
* How AsyncValue manages UI states
* How shared state works across multiple screens
* How Notifier classes manage business logic
* How build_runner generates provider files automatically
* How incorrect CLI usage can break Flutter execution

---

## Application structure

```txt
lib/
├── app/
│   └── app.dart
├── features/
│   └── counter/
│       ├── providers/
│       │   ├── counter_provider.dart
│       │   └── counter_provider.g.dart
│       └── view/
│           ├── home_page.dart
│           └── details_page.dart
```

---

## Key concepts understood

* Riverpod providers
* Notifier-based state management
* AsyncValue (loading, data, error)
* Code generation with build_runner
* Shared state across screens
* ref.watch vs ref.read
* Flutter CLI target files (`-t`)

---

## Reflection

Today was challenging but very important in understanding modern Flutter architecture.

The biggest breakthrough was understanding that state is not passed between screens — instead, both screens listen to a single shared provider.

I also improved my understanding of Riverpod code generation and how it reduces boilerplate and makes state management cleaner.

---

## Next steps

* Learn Navigation, theming, design token for day 5
