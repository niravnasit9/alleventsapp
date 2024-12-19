#  Application Name: [AllEvents]

#  1. Overview:-

   This app is a Flutter-based mobile application that allows users to sign up and log in using
   Firebase Authentication (via Google Sign-In and email/password). After logging in, users are
   redirected to the Main Screen where dynamic data is displayed in either a GridView or ListView
   format.Users can toggle between the two formats, and the data is fetched dynamically from an API.

   A Dropdown Button is also included at the top of the screen, which fetches data from the API.
   This allows users to select additional options. The Dropdown Button and a Toggle Button are
   placed in the same row for easy access. The Toggle Button enables users to switch between Viewing
   the Data
   in Grid or List format.

   When users press any item in the GridView or ListView, they are taken to a Details Page that
   shows more information about the selected item.

   The app uses GetX for state management, which is responsible for managing redirections between
   screens.

#  2. Prerequisites
   To build and run this app, you need the following:

   Flutter SDK: Version 3.5.3 or above
   Dart SDK: Version 3.5.3 or above
   Android Studio or Visual Studio Code: For development
   API access: For Dynamically Fetching data to be Displayed in the app

#  3. Installation:-

   3.1. Clone of the Repository
   Cloned repository containing the app's code.

   git clone:- https://github.com/niravnasit9/alleventsapp/

   3.2. Install Dependencies
   Navigate to the project directory and install the required dependencies.

   cd your-app-folder
   flutter pub get

#  4. Firebase Setup:-

   Follow These Steps to set up Firebase for Authentication:

   1.Go to the Firebase Console.
   2.Create a new Firebase project or select an existing one.
   3.Enable Firebase Authentication and configure Google Sign-In.
   4.Download the google-services.json (for Android) and GoogleService-Info.plist (for iOS), and add
   them to your project as instructed by Firebase.
   5.In the Firebase Authentication section, enable the google authentication and email/password
   sign-in method.

#  5. Running the App :-
   5.1. For Android
   To run the app on an Android device or emulator:
   flutter run

   5.2. For iOS
   To run the app on an iOS device or simulator:
   flutter run

#  6. Features :-
   # 6.1. User Authentication :-

   6.1.1 Users can sign up with their email and password or use Google Sign-In.

   6.1.2 The signup screen has fields for username,Email,Password,and Confirm Password.After Sign
   up, users are redirected to the login screen.

   6.1.3 The login screen includes Google Sign-In and Email and Password Fields,allowing users to
   log in with their Credentials.

   # 6.2. Main Screen

   6.2.1 After logging in, users are redirected to the main screen where dynamic data is displayed.

   6.2.2 The data follows the same structure and can be toggled between GridView and ListView
   Formats.

   6.2.3 A Dropdown Button, which also fetches data from an API, is placed at the top of the Main
   Screen, allowing users to select additional options.

   6.2.4 The Toggle Button, placed alongside the Dropdown Button, enables users to switch between
   viewing the data in Grid or List format.

   # 6.3. Data Details Page

   6.3.1 When users tap on any item in the GridView or ListView, they are taken to a detail page
   that provides more information about the selected item.

#  7. Contact Information :-
   For support or questions, contact[Nirav Nasit / niravnasit0351@gmail.com] or
   visit [https://github.com/niravnasit9/alleventsapp/]. for further update regarding this app
