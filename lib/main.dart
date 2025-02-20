import 'package:flutter/material.dart';
import 'package:earndia_app/widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新闻类App',
      theme: ThemeData(
        primaryColor: const Color(0xFF373A81),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MainBottomNavigation(),
    );
  }
}
