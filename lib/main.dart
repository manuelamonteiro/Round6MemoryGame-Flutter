import 'package:flutter/material.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/pages/home_page.dart';
import 'package:memory_game/utils/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MultiProvider(
    providers: [
      Provider<GameController>(create: (_) => GameController()),
    ],
    child: const MyApp(),
  ));
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
