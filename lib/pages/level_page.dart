import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/widgets/level_card.dart';

class LevelPage extends StatelessWidget {
  final Mode mode;
  const LevelPage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: [
            LevelCard(mode: mode, level: 6),
            LevelCard(mode: mode, level: 8),
            LevelCard(mode: mode, level: 12),
          ],
        ),
      ),
    );
  }
}
