<img align="right" width="300" alt="logo" src="https://user-images.githubusercontent.com/92455101/215042770-66273c82-6889-479e-a2a4-3c1f5a9e1230.png">

# EGreenBin

This mobile application is designed for teachers to manage students' waste disposal in schools. With this app, teachers can monitor, track and assess their students' waste collection and disposal habits. The app will provide an easy-to-use interface that allows teachers to log in, add students, assign duties and track waste disposal activities.

## App demo

**Link download apk for android**: [eGreenBin](https://drive.google.com/file/d/1VTPtGCNmN7gW3FWnvPVunL8GQx1P8L8j/view?usp=share_link)

## Video Preview

<img align="center" width="200" alt="UIApp" src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDIxYTBjYjYxMGMyNDlkN2E0YTM5MTBiNWMwMWI4NGI5ZTE2YTRhMCZjdD1n/IgTrLX9Ou58tmIaUBh/giphy.gif">

## Getting Started

To run any Android application built with Flutter you need to configure the enviroments in your machine, you can do this following the the tutorial provided by Google in [Flutter website](https://flutter.dev/docs/get-started/install)

- Flutter SDK
- Android Studio (to download Android SDK)
- Xcode (for iOS develop only)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

## Technologies

- Flutter
- Firebase storage
- EmailJS API
- API with Go backend and Database
- Firebase Google Auth (Comming soon)

## Setup

1. Clone the repository
2. Open the project in your preferred IDE (e.g. Android Studio, VS Code)
3. Run `flutter pub get` to install the required dependencies
4. Run the project in an emulator or on a physical device

## Roadmap

See the [open issues](https://github.com/GDSC-UIT/eGreenBin-mobile/issues) for a list of proposed features (and known issues).

# Project stucture

![GetX_Structure](assets/images/GetX_Structure.jpg)

```
// Directory structure for assets and app
- assets
  - animation: contains lotifile and animate files
  - icons : contains icon images for usage
  - images: contains app images
  - fonts : contains app fonts (you can using GoogleFont package)

- app
  - core
    - extensions: contains extensions for values in app
    - utils: contains common utility functions for app
    - languages:
      - en: sub directory for English language support
      - vi: sub directory for Vietnamese language support
    - values
      - app_string: contains common app strings
      - app_value: contains default values for app
      - image: contains path to images
    - theme:
      - app_colors: defines colors for entire app
      - text_styles: defines text styles for entire app

  - data
    // Directory responsible for containing everything related to our data
    - enums: contains self-defined enums
    - models: contains app models
    - providers: provides data (API, database, firebase, etc.)
    - services: contains app service functions (https, authentication service, etc.)

  - global_widgets: contains frequently used widgets in the app

  - modules
    - <module_name>: named after the functional name
      - screens: contains pages for the feature
      - widgets: contains local widgets only used in this feature
      - <module_name>\_controller.dart: Initializes controller for the feature
      - <module_name>\_binding.dart: Defines functions and variables for controller

  - routes
    - app_pages.dart: routes to corresponding pages
    - app_routes.dart: contains names of routes

- main.dart
```

## Resources

- [Design Figma](https://www.figma.com/file/RkQeskWhdVR0k9WSatQ9PY/eGreenBin-App?node-id=0%3A1&t=7N586K5yNSBOIYit-1)
- [Git](https://github.com/GDSC-UIT/eGreenBin-mobile.git)
- [Reference codebase](https://github.com/kauemurakami/getx_pattern)
