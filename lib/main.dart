import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/theme_switch.dart';
import 'package:portfolio/features/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      // create the provider
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aswin',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
