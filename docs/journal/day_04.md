# Day 4 Journal — Riverpod 2 with Code Generation (The Debugging Arc)

## Date

May 14, 2026

---

# What I worked on

Today I implemented Riverpod 2 with code generation in the Naija Wallet project using Very Good CLI architecture.

I built:

* a counter app using Riverpod
* shared state across two screens
* Riverpod code generation with `@riverpod`
* AsyncValue-based state handling
* notifier logic for counter updates

I also spent a large part of the day debugging Android build issues, Flutter flavor configuration problems, emulator failures, and Gradle output mismatches.

This became one of the most difficult but educational setup/debugging sessions so far.

---

# Main concepts learned

* Riverpod 2 code generation
* `@riverpod` annotations
* build_runner workflow
* shared global state across screens
* AsyncValue state handling
* Flutter flavors
* Android build variants
* APK generation process
* VS Code launch configurations
* Gradle build debugging

---

# What I achieved

* Successfully configured Riverpod 2 with code generation
* Generated `.g.dart` provider files successfully
* Built a counter app using shared provider state
* Connected HomePage and DetailsPage using one provider
* Successfully generated a development APK
* Fixed Android flavor configuration confusion
* Learned how VS Code launch configurations work
* Got the app finally running on a real Android device (TECNO BF7)

---

# Issues I ran into

## 1. Confusion about why two screens were needed

Initially, I did not understand why the assignment specifically required two screens for a counter app.

### What I learned

The purpose was to demonstrate shared global state using Riverpod.

Both screens watch the same provider:

```dart
ref.watch(counterProvider)
```

This allows state updates on one screen to instantly reflect on the other screen without manually passing data.

---

## 2. Riverpod code generation confusion

I was confused about:

* `riverpod_annotation`
* `riverpod_generator`
* `build_runner`
* generated `.g.dart` files

### Fix

I learned that:

* `@riverpod` triggers automatic code generation
* build_runner creates provider boilerplate automatically
* `.g.dart` files should never be edited manually

I continuously ran:

```bash
dart run build_runner watch
```

---

## 3. Generated files not appearing

At some point, generated provider files were not appearing correctly.

### Fix

I:

* restarted VS Code
* ran `flutter clean`
* ran `flutter pub get`
* ensured build_runner was running continuously

---

## 4. Flutter command mistakes

I mistakenly ran:

```bash
flutter run -v output
```

Flutter interpreted `output` as a target file and failed.

### Error

```txt
Target file "output" not found.
```

### Fix

I learned:

* `-v` means verbose logging
* `-t` means target file

Correct command:

```bash
flutter run -t lib/main_development.dart
```

---

## 5. Main entrypoint confusion

I later discovered that Very Good CLI projects do not always use the normal:

```txt
lib/main.dart
```

### Error

```txt
Target file "lib/main.dart" not found.
```

### Fix

Used:

```bash
flutter run -t lib/main_development.dart
```

---

## 6. Emulator completely breaking

The Android emulator started failing with:

```txt
Can't find service: activity
Can't find service: package
```

### What happened

The emulator became corrupted or failed to boot Android services correctly.

### Fix

I switched to using my real Android device:

```txt
TECNO BF7
```

This significantly improved stability and build testing.

---

## 7. APK signing confusion

I accidentally tried building a release APK using:

```bash
flutter build apk --flavor development
```

### Error

```txt
SigningConfig "release" is missing required property "storeFile"
```

### What I learned

Release builds require:

* keystore
* signing configuration
* storeFile
* passwords

### Fix

I switched back to debug builds:

```bash
flutter run --flavor development -t lib/main_development.dart
```

---

## 8. The biggest issue — Flutter flavor mismatch

This became the main debugging battle of the day.

Even though APKs were being generated successfully, Flutter kept showing:

```txt
Gradle build failed to produce an .apk file
```

### What was actually happening

The project used Android flavors:

* development
* staging
* production

Flutter sometimes searched for:

```txt
app-debug.apk
```

while Gradle generated:

```txt
app-development-debug.apk
```

This mismatch caused Flutter to think the APK did not exist.

---

## 9. VS Code launch configuration discovery

Eventually I discovered that the `.vscode/launch.json` file already contained proper launch configurations:

* Launch development
* Launch staging
* Launch production

### Final Fix

Instead of manually typing long commands every time, I now:

1. Run build_runner in terminal
2. Press `F5`
3. Select:

```txt
Launch development
```

This automatically handles:

* target file
* flavor
* debug configuration

---

# Biggest lesson from today

Today taught me that many software engineering problems are not caused by application code itself, but by:

* tooling
* environment setup
* build systems
* configuration mismatches
* Android/Gradle behavior

I also learned that debugging is a major part of software engineering and that persistence matters.

---

# Reflection

This was one of the most frustrating Flutter sessions I have had so far, but also one of the most educational.

At several points it felt like the project was completely broken, but the actual issue turned out to be:

* flavor configuration mismatches
* incorrect commands
* emulator problems
* APK output path confusion

In the end, the app finally worked successfully.

---

# Current workflow

## Terminal

```bash
dart run build_runner watch
```

## VS Code

* Press `F5`
* Select:

```txt
Launch development
```

---

# Next steps

* Learn Navigation, theming and design tokens for day 04
