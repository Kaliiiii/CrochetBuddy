import 'package:flutter/material.dart';
import 'HomePage.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crochet Buddy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: ' '),
    );
  }
}
