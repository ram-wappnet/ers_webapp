## 1 Project Name 🚀
#### Employee Review System
## 2 Project Description
#### Employee Review System is a comprehensive web application.
## 3 Technologies Used
- FLUTTER(MOBILE SIDE)
- DART FROG(BACKEND)
## 4 Prerequisites (Optional)
Before you begin, ensure you have met the following requirements:

#### 1 Operating System

- Windows, macOS, or Linux

#### 2 Flutter SDK

- Install the Flutter SDK from the [official website](https://flutter.dev/docs/get-started/install).
- Ensure the Flutter binary is added to your system PATH.

#### 3 Dart SDK

- The Dart SDK is bundled with Flutter; no separate installation is required.

#### Integrated Development Environment (IDE)

Recommended IDEs: 

- [Android Studio](https://developer.android.com/studio)
- [Visual Studio Code](https://code.visualstudio.com/)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/)

#### 4 IDE Plugins

- For Visual Studio Code:
  - Flutter extension
  - Dart extension
- For Android Studio/IntelliJ IDEA:
  - Flutter plugin
  - Dart plugin

#### 5 Command Line Tools

- Git: Install Git from the [official website](https://git-scm.com/).
- Optional: Install and set up [Git Bash](https://gitforwindows.org/) if you are using Windows.

#### 6 Mobile Device Emulators

- Android: Install Android Studio and set up an Android emulator.
- iOS (macOS only): Install Xcode from the Mac App Store and set up an iOS simulator.

#### 7 Additional Requirements for iOS Development (macOS only)

- Xcode: Install from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).
- CocoaPods: Install using the command `sudo gem install cocoapods`.


By following these prerequisites, you will have a solid foundation for developing Flutter applications. If you encounter any issues during the setup process, refer to the official [Flutter documentation](https://flutter.dev/docs) for detailed guidance.


## 5 Installation And Project Execution/Usage Steps
### Cloning the Repository

1. Clone the repository from GitHub:
    ```sh
    git clone git@git.wappnet.us:akshay-wappnet/ERS-Admin.git
    ```
2. Navigate to the project directory:
    ```sh
    cd ERS-Admin
    ```

### Environment Configuration

This project contains 2 environments. The environment configuration files are stored in a `config` folder, which is ignored in Git. You need to download this folder from Google Drive and place it in your project directory.

1. Download the `config` folder from [Google Drive](https://drive.google.com/file/d/18p_SWgJY30VQfwlP31hc2pAzEFYRbEqn/view?usp=sharing).
2. Extract the `config` folder into the lib directory.
```
save_a_plate_restaurant/
|- android
|- ios
|- lib
    |- config/
    |- main.dart
|- test
```
3. Ensure the `config` folder is added to your `.gitignore` file to avoid uploading it to the repository.

### Installing Dependencies

Install the required dependencies by running:
```sh
flutter pub get
```
## 7 Configuration(Environment Configurations) 🚀

This project contains 2 ENVIRONMENT:

- DEVELOPMENT
- PRODUCTION


To run the desired ENVIRONMENT either use the launch configuration in VSCode or use the following commands:

###### 1 DEVELOPMENT

```sh
$ flutter run --dart-define=ENVIRONMENT=DEVELOPMENT
```
###### 2 PRODUCTION

```sh
$ flutter run --dart-define=ENVIRONMENT=PRODUCTION
```
---
To build appbundle the desired ENVIRONMENT  use the the following commands:

###### 1 DEVELOPMENT

```sh
$ flutter build appbundle --no-tree-shake-icons --dart-define=ENVIRONMENT=DEVELOPMENT
```
###### 2 PRODUCTION

```sh
$ flutter build appbundle --no-tree-shake-icons --dart-define=ENVIRONMENT=PRODUCTION
```
---
To build apk the desired ENVIRONMENT  use the the following commands:

###### 1 DEVELOPMENT

```sh
$ flutter build apk --release --no-tree-shake-icons --dart-define=ENVIRONMENT=DEVELOPMENT
```
###### 2 PRODUCTION

```sh
$ flutter build apk --release --no-tree-shake-icons --dart-define=ENVIRONMENT=PRODUCTION
```
---

#### Creating launch configurations in VSCode to run app without command 🚀



Luckily, both of these are easily fixable with a launch.json file. At the root of our project, create a launch.json file inside a folder called .vscode.

```sh
// .vscode/launch.json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "ERS DEVELOPMENT",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define",
                "ENVIRONMENT=DEVELOPMENT"
            ],
            "flutterMode": "debug",
            "noDebug": true //when noDebug is true run without debugging when noDebug is false run with debugging
        },
        {
            "name": "ERS PRODUCTION",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define",
                "ENVIRONMENT=PRODUCTION"
            ],
            "flutterMode": "debug",
            "noDebug": true //when noDebug is true run without debugging when noDebug is false run with debugging
        },
    ]
}
```
---

## ADB Command to uninstall  app 🚀

### Command

```sh
$ adb uninstall com.ers.app
```


---
## Use this command to generate language key file 🚀
### Command
```sh
flutter pub run easy_localization:generate -S assets/langs -f keys -O lib/langs -o locale_keys.g.dart
```

---
## Use this command to run flutter web in local 🚀
### Command
```sh
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```
---


---
https://payamzahedi.com/toastification/
---