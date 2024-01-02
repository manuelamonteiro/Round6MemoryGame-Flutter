import 'package:memory_game/models/game_option.dart';
import 'package:memory_game/models/game_play.dart';
import 'package:memory_game/utils/constrants.dart';
import 'package:memory_game/utils/game_settings.dart';
import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOption> gameCards = [];
  @observable
  int score = 0;
  @observable
  bool won = false;
  @observable
  bool lost = false;

  late GamePlay _gamePlay;
  List<GameOption> _choice = [];
  List<Function> _choiceCallback = [];
  int _successes = 0;
  int _pairNumbers = 0;

  @computed
  bool get completeMove => (_choice.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _successes = 0;
    _pairNumbers = (_gamePlay.level / 2).round();
    won = false;
    lost = false;
    _resetScore();
    _generateCards();
  }

  _resetScore() {
    _gamePlay.mode == Mode.normal ? score = 0 : score = _gamePlay.level;
  }

  _generateCards() {
    List<int> cardOptions = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOptions = cardOptions.sublist(0, _pairNumbers);
    gameCards = [...cardOptions, ...cardOptions]
        .map((option) =>
            GameOption(option: option, matched: false, selected: false))
        .toList();
    gameCards.shuffle();
  }

  choose(GameOption option, Function resetCard) async {
    option.selected = true;
    _choice.add(option);
    _choiceCallback.add(resetCard);
    await _compareChoices();
  }

  _compareChoices() async {
    if (completeMove) {
      if (_choice[0].option == _choice[1].option) {
        _successes++;
        _choice[0].matched = true;
        _choice[1].matched = true;
      } else {
        await Future.delayed(
          const Duration(seconds: 1),
          (() {
            for (var i in [0, 1]) {
              _choice[i].selected = false;
              _choiceCallback[i]();
            }
          }),
        );
      }

      _resetMove();
      _updateScore();
      _checkGameResult();
    }
  }

  _resetMove() {
    _choice = [];
    _choiceCallback = [];
  }

  _updateScore() {
    _gamePlay.mode == Mode.normal ? score++ : score--;
  }

  _checkGameResult() async {
    bool allMatched = _successes == _pairNumbers;
    if (_gamePlay.mode == Mode.normal) {
      await _checkResultModeNormal(allMatched);
    } else {
      await _checkResultModeRound6(allMatched);
    }
  }

  _checkResultModeNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), (() => won = allMatched));
  }

  _checkResultModeRound6(bool allMatched) async {
    if (_endChances()) {
      await Future.delayed(const Duration(seconds: 1), (() => lost = true));
    }

    if (allMatched && score > 0) {
      await Future.delayed(
          const Duration(seconds: 1), (() => won = allMatched));
    }
  }

  _endChances() {
    return score < _pairNumbers - _successes;
  }

  restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int levelIndex = 0;
    if (_gamePlay != GameSettings.levels.last) {
      levelIndex = GameSettings.levels.indexOf(_gamePlay.level) + 1;
    }

    _gamePlay.level = GameSettings.levels[levelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
