import 'package:flutter/material.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/widgets/start_button.dart';

class FeedbackGame extends StatelessWidget {
  final Result result;

  const FeedbackGame({
    Key? key,
    required this.result,
  }) : super(key: key);

  String getResult() {
    return result == Result.approved ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${getResult().toUpperCase()}!',
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('images/${getResult()}.png'),
          ),
          result == Result.eliminated
              ? StartButton(
                  title: 'Tentar novamente',
                  color: Colors.white,
                  action: () {},
                )
              : StartButton(
                  title: 'Próximo nível',
                  color: Colors.white,
                  action: () {},
                ),
        ],
      ),
    );
  }
}
