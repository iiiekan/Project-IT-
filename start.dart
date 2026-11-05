import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    navigat
    return MaterialApp(
      title: 'Final Project',
      theme: ThemeData(primarySwatch: Colors.blue), // Add consistent theme
      home: const HomeScreen(),
    );
  }
}