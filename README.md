# Blog Explorer
<p id="description">Blog Explorer is a feature-rich mobile application that allows users to explore blogs, bookmark their favorite ones, and enjoy a smooth reading experience with a clean, minimalistic UI design. The app leverages REST API for fetching blog data, Hive for offline storage, and Bloc for state management to provide a seamless experience.</p>
</br>
<h2>Project Screenshots:</h2>
</br>

<img src="https://github.com/user-attachments/assets/0bf22011-b157-4fea-8a0f-c561b8816146" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/eeb3ff28-0c8e-4762-8791-462942573ff1" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/e6711ea9-b2b1-4dd4-9b4e-c8143e5a81e7" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/d56222a2-f8c9-4d63-b5c7-caf7c17d4b70" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/20717632-dfa3-4d5a-a892-84a5335d7e78" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/15941f9c-47fc-4de3-8609-86fcaa3bc7e7" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/6ff393e9-8a80-4abb-9b48-1086b4c33e5c" alt="project-screenshot" width="210" height="460/">

<img src="https://github.com/user-attachments/assets/86a312f7-f680-477c-be06-42862237c0a5" alt="project-screenshot" width="210" height="460/">
</p>
  
</br>
<h2>📱 App's apk</h2>
</br>
Link: https://drive.google.com/file/d/1LaJlh5poyx14Ylh7M78IjsvKgBmKbo4c/view?usp=drive_link
</br>
</br>
<h2>🧐 Features</h2>
</br>
Here are some of the key features of the Blog Explorer app:

*  <b><i>Read Blogs</i></b>: A minimilastic UI app to read blogs.
*  <b><i>REST API Integration</i></b>: Fetches blog details from a remote server using REST API.
*  <b><i>Offline Storage</i></b>: Stores blog data locally using Hive, allowing users to access blogs even without an internet connection.
*  <b><i>Interactive App</i></b>: Allows users to bookmark blogs for easy access later.
*  <b><i>Bloc State Management</i></b>: Ensures smooth app functioning and easy management of states across the application.
*  <b><i>Dependency Injection</i></b>: Uses Get_It for depedency injection
*  <b><i>Error Handling</i></b>: Displays appropriate error messages on screen in case of API failures.
*  <b><i>Smooth Transitions</i></b>: Provides a smooth and engaging user experience with various transitions within the app.
*  <b><i>Caching Images</i></b>: Caches images for a faster and smoother browsing experience.
</br>
<h2>📱 Various Screens</h2>
</br>
The app includes the following screens:

* Blog List View Screen: Displays a list of blogs fetched from the API.
* Blog Detailed View Screen: Provides a detailed view of a selected blog.
* Bookmarked Blogs Screen: Shows blogs that have been bookmarked by the user.
</br>
<h2>🛠️ Bloc Usage</h2>
</br>
Bloc is used extensively in the app for:

* Dark and Light Theme: Automatically manages the theme of the app based on the device's theme using Bloc.
* Navigation: Handles navigation between the home screen and the bookmarked blogs screen.
* Bookmarking Blogs: Allows users to bookmark blogs from both the list view and the detailed view.
</br>
<h2>💻 Built With</h2>
</br>
Technologies used in the project:

* Flutter
* Hive DB
* REST API
</br>
<h2>🛠️ Installation Steps:</h2>
<p>1. Install Flutter SDK and setup Android Studio follow the below link for more help: https://docs.flutter.dev/get-started/install/windows/mobile</p>

<p>2. Fork the repository in your github account and download the code in your local machine</p>

<p>3. Open terminal in the app's source folder and type the following code for getting all dependencies</p>

```
flutter pub get
```

<p>4. Now select a device from your Android Studio or VS Code or connect your phone to machine to run it in phone directly and select phone as the device</p>

<p>5. Run the following command in the terminal of folder's source code to run the app</p>

```
flutter build apk --release
```

<p>5. Now once the apk is built simply install app in your device using this command: </p>

```
flutter install
```
(Note: prevent running app in debug mode for smoother experience and follow the above two commands for release app version.)
</br>
