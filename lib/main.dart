import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timepass/counter_provider.dart';
import 'package:timepass/home_screen.dart';
import 'package:timepass/theme_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => CounterProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      title: 'Timepass',
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
