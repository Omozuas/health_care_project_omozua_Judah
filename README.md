# User List App - Flutter (Riverpod, HTTP)

A simple Flutter app that fetches users from an API, displays them in a list with images, and implements pull-to-refresh, error handling, and search functionality using Riverpod.

##  Features

✅ Fetches user data from https://jsonplaceholder.typicode.com/users
✅ Displays users with names, emails, and avatars
✅ Uses Riverpod for state management
✅ Pull-to-refresh to reload users
✅ Handles API errors gracefully
✅ Search functionality to filter users
✅ Offline & timeout handling
✅ Auto-assigns images to users

## Installation Guide
1️⃣ Prerequisites
Make sure you have the following installed:

Flutter SDK (>=3.0.0) → Install Flutter
Dart (>=2.17.0)
Android Studio / VS Code
Git (optional, if cloning from GitHub)
2️⃣ Clone the repository (optional)
If the project is hosted on GitHub, clone it using:

git clone https://github.com/Omozuas/health_care_project_omozua_Judah.git


cd health_care_project_omozua_Judah
If not using Git, download the ZIP and extract it.

3️⃣ Install dependencies
Run the following command to install all required Flutter packages:

flutter pub get

4️⃣ Run the App
To launch the app on an emulator or a physical device, run:

flutter run

For Android:
flutter run -d android

For iOS:
flutter run -d ios

## Project Structure

The project is structured as follows:
markdown
lib/
 ┣ 📂 api/               # API-related files
 ┃ ┣ 📂 river_pod/       # State management using Riverpod
 ┃ ┃ ┗ 📜 user_provider.dart
 ┃ ┣ 📂 user_api/        # API service files
 ┃ ┃ ┣ 📜 user_api.dart  # API calls to fetch users
 ┃ ┃ ┣ 📜 api_services.dart  # API helper functions
 ┃ ┃ ┗ 📜 urls.dart      # API base URLs & endpoints
 ┣ 📂 common/            # Reusable UI components and styles
 ┃ ┣ 📜 app_style.dart   # Global styles (e.g., fonts, colors)
 ┃ ┗ 📜 reuseable_text.dart # Reusable text widgets
 ┣ 📂 model/             # Data models
 ┃ ┗ 📜 user_model.dart  # User data model
 ┣ 📂 theme/             # Theme-related files
 ┃ ┗ 📜 constants.dart   # App-wide constants
 ┣ 📂 views/             # UI Screens
 ┃ ┗ 📜 user_screen.dart # UI for displaying user list
 ┣ 📜 app.dart           # App setup
 ┣ 📜 main.dart          # App entry point


 Contact
📩 Email: [yourname@example.com](iyanuomozua@gmail.com)
🐙 GitHub: [Your GitHub](https://github.com/Omozuas/health_care_project_omozua_Judah)
🚀 LinkedIn: [Your LinkedIn](https://www.linkedin.com/in/judah-omozua-7234a325a/)