import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int option;

  const CardGame({
    Key? key,
    required this.modo,
    required this.option,
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:
                widget.modo == Modo.normal ? Colors.white : Round6Theme.color,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: widget.modo == Modo.normal
                ? const AssetImage('images/card_normal.png')
                : const AssetImage('images/card_round.png'),
          )),
    );
  }
}
