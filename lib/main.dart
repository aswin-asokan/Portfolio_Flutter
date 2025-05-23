import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/darkmode.dart';
import 'package:portfolio/core/themes/lightmode.dart';
import 'package:portfolio/features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aswin',
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
