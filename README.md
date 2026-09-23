# FitMate

**Browse workout plans. Explore trainers. Save your favorite plans.**

FitMate is a fitness app developed as a **group project during the Flutter Training Bootcamp | CS Academy**. The project focuses on displaying workout plans and trainers and letting users save plans to their favorites. It does not measure fitness progress or track workout performance.

## Project Scope

- Browse workout plans and view their details.
- Explore trainers and search by name or specialty.
- Save workout plans to favorites for easy access.
- Create an account and sign in with email and password.

## Tech Stack

| Area | Technology | Purpose |
| --- | --- | --- |
| App development | Flutter & Dart | Build the app's screens and features. |
| State management | Cubit (`flutter_bloc`) | Manage application state and update the UI when that state changes. |
| Backend | Supabase | Handle authentication and retrieve workout plan and trainer data. |
| Dependency injection | GetIt | Provide shared services and repositories to app features. |

## Supabase

The app uses **Supabase Auth** for registration, login, and logout. It also uses **Supabase** to load the workout plans and trainers displayed in the app.

## Local Preferences

The code includes a `SharedPreferencesService` using `SharedPreferencesAsync`, prepared to remember whether the user has completed onboarding. This service is not currently called by the app's screens, so onboarding completion is not yet saved through it.

## Team & Contributions

| GitHub | Main Contributions |
| --- | --- |
| [@ReemMohsn](https://github.com/ReemMohsn) | App foundation, shared services, splash and welcome screens, authentication, and integration. |
| [@MohamedHany1512](https://github.com/MohamedHany1512) | Featured workout plans, trainer discovery and search, and related Supabase data access. |
| [@IbrahimHamas](https://github.com/IbrahimHamas) | Plans catalog, plan details, exercise day views, and favorite plans. |
| [@Romaisaahassan](https://github.com/Romaisaahassan) | Profile and edit profile screens, image selection, and profile state management. |
