import 'package:flutter/material.dart';
import 'package:memory_game/constrants.dart';
import 'package:memory_game/pages/nivel_page.dart';
import 'package:memory_game/theme.dart';
import 'package:memory_game/widgets/logo.dart';
import 'package:memory_game/widgets/recordes.dart';
import 'package:memory_game/widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.white,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NivelPage(modo: Modo.normal),
                  ),
                );
              },
            ),
            StartButton(
              title: 'Modo Round 6',
              color: Round6Theme.color,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NivelPage(modo: Modo.round6),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            const Recordes(),
          ],
        ),
      ),
    );
  }
}
