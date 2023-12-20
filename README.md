<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Elevate your Dart application's user experience with our lightweight and intuitive Toast Plugin. Designed for simplicity and efficiency, this plugin empowers developers to effortlessly display toast messages that automatically dismiss, providing a seamless way to communicate essential information to users.

This is inspired by the app at https://schoolofnewafrica.com/. All the credit to my product design lead Tagoe Kingston (https://dribbble.com/niimantse), who is the brain behind the UI concept.


## Features

![timeline_tree](https://github.com/bright2kwame/flutter_simple_toast/blob/flutter_simple_toast/assets/simple_toast_image.png)

• Easy Integration:
  Swiftly integrate toast notifications into your Dart applications with minimal setup. Our 
  plugin is designed for hassle-free implementation, saving you valuable development time.

• Automatic Dismissal:
  Say goodbye to manual dismissals. Our Toast Plugin is equipped with automatic dismissal     
  functionality, ensuring that your toast messages gracefully fade away after a customizable 
  duration.

• Customization Options:
  Tailor the appearance of your toast messages to align with your application's aesthetics. 
  Customize text, background color, duration, and more to create a seamless and branded user 
  experience.

• Responsive Design:
  Whether you're developing for mobile, web, or desktop, our plugin adapts seamlessly to various 
  screen sizes and resolutions, ensuring a consistent and visually appealing toast experience 
  across platforms.

## Getting started

To install the package, run this command:

```
 $ flutter pub add simple_toast

```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```yaml
dependencies:
  simple_toast: ^0.0.1

```

Import it and use it in your dart code:

```
import 'package:simple_toast/simple_toast.dart';

```

## Usage

Simple Toast

• Show information, you invoke this by calling info toast 

```dart
 SimpleToast.showInfoToast();
```
• Show error message, this presents error message

```dart
 SimpleToast.showErrorToast();
```
• Show success message, this presents success message

```dart
 SimpleToast.showSuccessToast();
```


## Example

• Import the package
```dart
 //import the plugin
 import 'package:simple_toast/simple_toast.dart';
```

```dart
  SimpleToast.showInfoToast(context, "Info Title", "Information displayed on info");
```
```dart
  SimpleToast.showSuccessToast(context, "Success Title", "Information displayed on success");
```
```dart
  SimpleToast.showErrorToast(context, "Error Title", "Information displayed on error");
```
