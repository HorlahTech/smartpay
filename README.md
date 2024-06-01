# SmartPay Flutter Application

## Overview
SmartPay is a Flutter application that provides a seamless user experience for signing in, signing up, managing user authentication and generate secret message. 
I used riverpod statemanagement to real time upadate, and MVC pattern for code separation and code reusability
Also, To achieve  secure integration and persisting user's pin, I used flutter_secure_storage package which make use of native encryption to save data locally.



## Project Structure

smartpay/
│
├── lib/
| |── models/
│ ├── controllers/
│ │ └── auths/
│ │ └── auth_controller/
│ │ └── auth_controller.dart
│ ├── routes/
│ │ └── app_routes.dart
│ ├── views/
│ │ ├── auths/
│ │ │ ├── acc_created.dart
│ │ │ ├── newpassword_view.dart
│ │ │ ├── password_recovery_view.dart
│ │ │ ├── signin_view.dart
│ │ │ ├── signup_view.dart
│ │ │ ├── userdetails_view.dart
│ │ │ ├── verify_email_view.dart
│ │ ├── home/
│ │ │ └── home_view.dart
│ │ ├── onboarding/
│ │ │ └── onboarding.dart
│ │ └── splash_screen/
│ │ └── splash_screen.dart
│ ├── widgets_utils/
│ │ ├── app_buttons.dart
│ │ ├── app_colors.dart
│ │ ├── app_container.dart
│ │ ├── app_text.dart
│ │ ├── constants.dart
│ │ ├── custom_backicon.dart
│ │ ├── image_files.dart
│ │ ├── input_text_fields.dart
│ │ ├── screen_body.dart
│ │ ├── spacing.dart
│ └── main.dart
└── pubspec.yaml

## Custom Widgets
ScreenBody Widget
The ScreenBody widget provides a consistent and re usable layout structure for screens. It includes an optional app bar, safe area, and padding.

TextInputeField Widget
This is a reusable widget that embed Textfiled, 

AppImage class
Tis is the class that define all the image asset we use throughout the project

AppColors class
I define the colors properties I used throughout the project
