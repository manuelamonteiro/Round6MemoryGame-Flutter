import 'package:flutter/material.dart';
import 'package:memory_game/pages/home_page.dart';
import 'package:memory_game/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      theme: Round6Theme.theme,
      home: const HomePage(),
    );
  }
}