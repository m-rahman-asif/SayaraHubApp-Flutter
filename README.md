# 🚗 SayaraHub Flutter App

SayaraHub is a cross-platform Flutter application that provides car service discovery, booking notifications, and user profile management. The app integrates Firebase for authentication, storage, and push notifications.

---

## Features

- **Welcome Animation:** Animated welcome screen with dynamic words.
- **Authentication:** Google & Facebook login, email/password login.
- **Home:** Browse popular car services and top-rated garages.
- **Profile:** View and edit profile, toggle push notifications, logout.
- **Notifications:** Real-time alerts with swipe-to-delete functionality.
- **Firebase Integration:** Authentication, Firestore (optional), and storage.

---

## Screenshots

Screenshots of the functioning app are provided in the "in_app_screenshots" folder.

---

## Technologies Used

- **Flutter**
- **Dart**
- **Firebase (Auth, Firestore, Storage)**
- **GetX** (State Management & Navigation)
- **GetStorage** (Local Storage)

---

## Setup Instructions

Follow these steps to run the project locally:

### 1. Clone the Repository

git clone https://github.com/m-rahman-asif/SayaraHubApp-Flutter.git
cd <SayaraHubApp-Flutter>

### 2. Install Flutter Dependencies

flutter pub get

### 3. Firebase Configuration

This project uses Firebase for authentication and push notifications. Follow these steps:

###Android

1. Go to Firebase Console and create a project (e.g., sayarahub-dev).

2. Add an Android app to the project with your package name (com.example.sayara_hub).

3. Download the google-services.json file and place it in android/app/.

4. Add Firebase SDK to your android/build.gradle:

classpath 'com.google.gms:google-services:4.3.15' // Check for latest version

5. Apply plugin in android/app/build.gradle:

apply plugin: 'com.google.gms.google-services'

###iOS

1. Add an iOS app in Firebase with your bundle ID (com.example.sayaraHub).

2. Download GoogleService-Info.plist and place it in ios/Runner/.

3. Add Firebase dependencies in ios/Podfile if required.

4. Run pod install in ios/.

###FlutterFire CLI (Optional)

If you want to regenerate firebase_options.dart:

dart pub global activate flutterfire_cli
flutterfire configure

### 4. Run the App

flutter run

---

## Dependencies

get: ^4.6.5

firebase_core: ^2.25.0

firebase_auth: ^4.8.0

get_storage: ^2.0.3

google_sign_in: ^6.1.0

flutter_facebook_auth: ^5.1.2

google_fonts: ^4.0.4

flutter_slidable: ^3.0.0

(Check pubspec.yaml for exact versions)

---

##Contributing

1. Fork the repository.
2. Create a feature branch: git checkout -b feature/my-feature
3. Commit changes: git commit -am 'Add my feature'
4. Push: git push origin feature/my-feature
5. Open a Pull Request.


##Contact

Developer: Mushfiqur Rahman
Email    : mushfiqurrahman.dm@gmail.com
LinkedIn : https://www.linkedin.com/in/mushfiqur-rahman-asif/
