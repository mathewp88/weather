import 'package:flutter/material.dart';
import 'package:weather/screens/loadingscreen.dart';
import 'package:weather/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (_) => LoadingScreen(),
      },
    );
  }
}
