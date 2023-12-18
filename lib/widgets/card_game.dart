import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/theme.dart';

class CardGame extends StatefulWidget {
  final Mode mode;
  final int option;

  const CardGame({
    Key? key,
    required this.mode,
    required this.option,
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
    if (!animation.isAnimating) {
      animation.forward();
      Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage('images/${widget.option.toString()}.png');
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
