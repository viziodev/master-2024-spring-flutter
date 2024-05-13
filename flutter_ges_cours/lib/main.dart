import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/screens/home/home.screen.dart';

void main() {
  runApp( new MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}
