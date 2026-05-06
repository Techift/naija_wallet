# Day 3 Journal — Project Scaffolding

## What I worked on
Today I set up the initial structure of the Naija Wallet Flutter project using Very Good CLI. I configured linting, created the GitHub repository, and set up branch protection rules.

---

## Issues I ran into

### 1. Bloc vs Riverpod conflict
I initially had Bloc-related setup conflicting with my plan to use Riverpod. This caused confusion and made it difficult to proceed cleanly with the architecture I wanted.

**What I did:**
- I deleted the old repository completely
- Recreated a fresh project using a cleaner setup
- Decided to fully commit to Riverpod as the state management solution

---

### 2. Git commit issues
I made mistakes with Git commits such as:
- Incorrect or vague commit messages like "first commit"
- Not staging files properly before committing
- Small confusion with file naming (README.md vs readme.md)

**What I learned:**
- Always stage changes before committing
- Use conventional commits (feat:, chore:, docs:, fix:)
- Keep commit history clean and intentional

---

### 3. Git branch and workflow setup
I had to properly set up:
- `main` branch protection
- `develop` branch workflow
- Understanding how pull requests should flow into main

---

### 4. Git line ending warning (LF vs CRLF)
I saw warnings about LF being replaced by CRLF.

**What I learned:**
- This is not an error
- It is caused by Windows line endings
- It does not affect the project

---

## What I achieved
- Created a clean Flutter project using Very Good CLI
- Set up GitHub repository with proper structure
- Configured branch protection
- Set up `.env.example`
- Replaced README with structured documentation
- Established a proper Git workflow

---

## Key lessons
- Clean architecture decisions must be made early
- Do not mix state management systems (Bloc + Riverpod)
- Git discipline matters more than I expected
- Setup work is just as important as coding

---

## Next step
Start Day 4: Riverpod setup and state management understanding.