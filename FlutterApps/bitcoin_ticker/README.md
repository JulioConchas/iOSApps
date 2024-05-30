# bitcoin_ticker

This is an app that display different bitcoin values for several currencies

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Learning Module notes:

* The Material DrodownButton Widget
 - Create a coin_data.dart which contain list of currencies like 'MEX'
   Create DopdownButton<String>(items:, onChange), have to specify type of data
   for items will create a list of DropdownMenuItems(child)
   child will require a Widget for example Text('UDS') and a value
   e.g:
   dropdownMenuItem(child Text('USD"), value "USD")

   onChanged (value) { print value }
   set DropDownButton value property which is the default value at the begining 

   create a new property String selectedCurrency 
   use this new selectedCurrency as default value for dropdownButton

   and onChanges callback use setState selectCurrenty = value to update currency 
   displayed in GUI

* Dart Loops
- for(int i = 0; i<7; i++){
    // Do something 7 -0
}
    same sintax as C and Java
- for loop for list<datatype>
    for(dataType var in list)

* Building Widgets with Loops Solution

    - create a new method for mainScreen getDropdownItems() , have to use coint_data.dar to loop thru 
    - getDropdownItems shoud return a list of Widgets, widgets will be DropdownMenuItes with elements from list in coin_data.dart
    - getDropdownItems return a list of Widgets -> DopdownMenuItems<String>
    - use a for in loop

* Introducing Cupertino Widgets
    - Cupertino is librari focuset in iOS widgets  iOS-Style
    - Instead of DropdownButton as child of container use CupertinoPicker 
    - CupertinoPicker(itemExtent, onSelectedItemChanged, children)
    - onSelectedItemChanged patameter callback (selectedIdex), can be printed
    - children we can use our getDropdownItem function
    - backgroundColor of CupertinoPicker can change the color of the widget

* Building Platform Specific UI (iOS & Android )
    - refactor getDropdownItems to return the DropdownButton , can rename to androidDropDown
    - create a method to return iOSPicker
    - create a new method Widget getPicker to chose between IOSPicker or androidDropdown
    - choose bettween platforms we can use ('dart:io' show Platform;) library and 
    - if (Platform.isIOS) or if Platform.android
    - we can use ternary operator in Container child
