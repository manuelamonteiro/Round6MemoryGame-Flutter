import 'package:flutter/material.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/game_play.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/pages/game_page.dart';
import 'package:memory_game/utils/theme.dart';
import 'package:provider/provider.dart';

class LevelCard extends StatelessWidget {
  final GamePlay gamePlay;

  const LevelCard({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

   startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);

    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.mode == Mode.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.mode == Mode.normal
              ? Colors.transparent
              : Round6Theme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(gamePlay.level.toString(), style: const TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
