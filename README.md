# flutter_random_quotes_app_wth_clean_architecture

A new Flutter project.

## Getting Started

## Project Structure
```text
 ├── assets
 |   ├── images
 |       ├── 1x
 |        ├── logo.png
 |
 |       ├── 1.5x
 |        ├── logo.png
 |
 |       ├── 2x
 |        ├── logo.png
 |
 |       ├── 3x
 |        ├── logo.png
 |
 |       ├── 4x
 |        ├── logo.png
 |
 |   ├── langs
 |       ├── en.json             # English translation
 |       ├── ar.json             # Arabic translation
 |    
 ├── lib
     ├── src                  
     |   ├── config              # App Shared Configs [routes - themes - locale]
     |   |     ├── routes
     |   |     ├── themes
     |   |     ├── locale
     |   |
     |   ├── core                # App Core [strings - colors - assets - api ....]
     |   |     ├── api
     |   |     ├── errors
     |   |     ├── json
     |   |     ├── netwrok
     |   |     ├── usecase
     |   |     ├── utils
     |   |     ├── widgets
     |   |
     |   ├── features
     |   |     ├── splash
     |   |     |    ├── data
     |   |     |    |    ├── data_sources
     |   |     |    |    |    ├── local_data_source
     |   |     |    |    |    
     |   |     |    |    ├── repositories
     |   |     |    |    |    ├── language_repository_impl.dart 
     |   |     |    |
     |   |     |    ├── domain
     |   |     |    |    ├── repositories
     |   |     |    |    |    ├── language_repository.dart
     |   |     |    |    |
     |   |     |    |    ├── use_cases
     |   |     |    |    |    ├── change_language_use_case.dart
     |   |     |    |    |    ├── get_last_saved_lanuage_use_case.dart
     |   |     |    |
     |   |     |    ├── presentation
     |   |     |    |    ├── cubit
     |   |     |    |    |    ├── locale_cubit.dart
     |   |     |    |    |    ├── locale_states.dart
     |   |     |    |    |
     |   |     |    |    ├── screens
     |   |     |    |    |    ├── splash_screen.dart
     |   |     |    |
     |   |     |   
     |   |     ├── random_quote
     |   |     |    ├── .....
     |   |
     |   ├── components.dart     # Shared Components
     |   ├── injector.dart       # Dependency Injection
     |
     ├── app_prefs.dart          # Shared Preferences
     ├── app.dart                # Material App
     └── bloc_observer.dart      # Bloc Observer.
     └── main.dart               # main method.
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
