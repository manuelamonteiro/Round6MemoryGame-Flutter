import 'package:flutter/material.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/utils/theme.dart';

class RecordsPage extends StatelessWidget {
  final Mode mode;
  final List<String> recs = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];

  RecordsPage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  getMode() {
    return mode == Mode.normal ? 'Normal' : 'Round 6';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 36, bottom: 24),
                      child: Center(
                        child: Text(
                          'Modo ${getMode()}',
                          style: const TextStyle(
                              fontSize: 28, color: Round6Theme.color),
                        ),
                      ),
                    )
                  : ListTile(
                      title: Text(recs[index]),
                      trailing: const Text('X jogadas'),
                      tileColor: Colors.grey[900],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    );
            },
            separatorBuilder: (_, __) => const Divider(
                  color: Colors.transparent,
                ),
            itemCount: recs.length),
      ),
    );
  }
}
