import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/game_option.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/utils/theme.dart';
import 'package:provider/provider.dart';

class CardGame extends StatefulWidget {
  final Mode mode;
  final GameOption gameOption;

  const CardGame({
    Key? key,
    required this.mode,
    required this.gameOption,
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    final game = context.read<GameController>();

    if (!animation.isAnimating &&
        !widget.gameOption.matched &&
        !widget.gameOption.selected &&
        !game.completeMove) {
      animation.forward();
      game.choose(widget.gameOption, resetCard);
    }
  }

  resetCard(){
    animation.reverse();
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage('images/${widget.gameOption.option.toString()}.png');
    } else {
      return widget.mode == Mode.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          final angle = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle);

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.mode == Mode.normal
                        ? Colors.white
                        : Round6Theme.color,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: getImage(angle),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
