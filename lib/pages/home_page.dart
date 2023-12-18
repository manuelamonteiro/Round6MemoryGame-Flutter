import 'package:flutter/material.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/pages/level_page.dart';
import 'package:memory_game/utils/theme.dart';
import 'package:memory_game/widgets/logo.dart';
import 'package:memory_game/widgets/records.dart';
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
                        const LevelPage(mode: Mode.normal),
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
                        const LevelPage(mode: Mode.round6),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            const Records(),
          ],
        ),
      ),
    );
  }
}
