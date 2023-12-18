import 'package:flutter/material.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/pages/game_page.dart';
import 'package:memory_game/utils/theme.dart';

class LevelCard extends StatelessWidget {
  final Mode mode;
  final int level;

  const LevelCard({
    Key? key,
    required this.mode,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                GamePage(mode: mode, level: level),
          ),
        ),
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: mode == Mode.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: mode == Mode.normal
              ? Colors.transparent
              : Round6Theme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(level.toString(), style: const TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
