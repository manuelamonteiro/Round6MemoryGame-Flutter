import 'package:flutter/material.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/pages/records_page.dart';
import 'package:memory_game/utils/theme.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  showRecords(Mode mode) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => RecordsPage(mode: mode),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: Round6Theme.color,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Mode.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Mode.round6),
            ),
          ],
        ),
      ),
    );
  }
}
