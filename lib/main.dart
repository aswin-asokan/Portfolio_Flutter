import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/core/themes/darkmode.dart';
import 'package:portfolio/core/themes/lightmode.dart';
import 'package:portfolio/core/themes/theme_provider.dart';
import 'package:portfolio/features/shared/extension/router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = goRouter;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'aswin',
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
