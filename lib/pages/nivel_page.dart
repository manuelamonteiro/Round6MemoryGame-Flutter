import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;
  const NivelPage({
    Key? key,
    required this.modo,
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
            CardNivel(modo: modo, nivel: 6),
            CardNivel(modo: modo, nivel: 8),
            CardNivel(modo: modo, nivel: 12),
          ],
        ),
      ),
    );
  }
}
