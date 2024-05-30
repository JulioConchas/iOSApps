# quepex_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Module 15 Flash Chat - Flutter x Firebase Cloud firestore notes

* Named Routes Challenge
- there is a cookbook for Routes in flutter doc, refet to it next time
- in MaterialApp routes property create a rout map 
- routes: { 'welcome_screen': (context) => WelcomeScreen(), etc..}
- MaterialApp initialRoute property is used to set the initial rout/screen in this case we'll set 'welcome_screen' as initial rout
- NOTE: if using initialRoute, MaterialApp home attr can't be use that will make conflicts
- static String CN can be use as key in MaterialApp routes map which makes it more efficient
