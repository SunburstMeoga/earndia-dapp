import 'package:flutter/material.dart';
// import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // 登录页面为主入口
    );
  }
}
