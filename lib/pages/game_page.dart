import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/widgets/card_game.dart';
import 'package:memory_game/widgets/feedback_game.dart';

class GamePage extends StatelessWidget {
  final Mode mode;
  final int level;

  const GamePage({
    Key? key,
    required this.mode,
    required this.level,
  }) : super(key: key);

  getAxisCount() {
    if (level < 10) {
      return 2;
    } else if (level == 10 || level == 12 || level == 18) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(mode == Mode.round6
                    ? Icons.my_location
                    : Icons.touch_app_rounded),
                const SizedBox(width: 10),
                const Text('18', style: TextStyle(fontSize: 25)),
              ],
            ),
            Image.asset('images/host.png', width: 38, height: 60),
            TextButton(
              child: const Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // body: const FeedbackGame(resultado: Resultado.eliminado),

      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: getAxisCount(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(24),
          children: [
            ...List.generate(
              level,
              (index) => CardGame(
                mode: mode,
                option: Random().nextInt(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
