import 'package:flutter/material.dart';
import './calculator.dart';

void main() {
  runApp(MyApp());
}

class MyColors {
  static const MaterialColor paleBlue = MaterialColor(
    0xffb8e3ea,
    <int, Color>{
      50: Color(0xffb8e3ea),
      100: Color(0xffb8e3ea),
      200: Color(0xffb8e3ea),
      300: Color(0xffb8e3ea),
      400: Color(0xffb8e3ea),
      500: Color(0xffb8e3ea),
      600: Color(0xffb8e3ea),
      700: Color(0xffb8e3ea),
      800: Color(0xffb8e3ea),
      900: Color(0xffb8e3ea),
    },
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MyColors.paleBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Calculator(operations: false),
    );
  }
}
