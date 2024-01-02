// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on GameControllerBase, Store {
  Computed<bool>? _$completeMoveComputed;

  @override
  bool get completeMove =>
      (_$completeMoveComputed ??= Computed<bool>(() => super.completeMove,
              name: 'GameControllerBase.completeMove'))
          .value;

  late final _$gameCardsAtom =
      Atom(name: 'GameControllerBase.gameCards', context: context);

  @override
  List<GameOption> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameOption> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$scoreAtom =
      Atom(name: 'GameControllerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$wonAtom = Atom(name: 'GameControllerBase.won', context: context);

  @override
  bool get won {
    _$wonAtom.reportRead();
    return super.won;
  }

  @override
  set won(bool value) {
    _$wonAtom.reportWrite(value, super.won, () {
      super.won = value;
    });
  }

  late final _$lostAtom =
      Atom(name: 'GameControllerBase.lost', context: context);

  @override
  bool get lost {
    _$lostAtom.reportRead();
    return super.lost;
  }

  @override
  set lost(bool value) {
    _$lostAtom.reportWrite(value, super.lost, () {
      super.lost = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
won: ${won},
lost: ${lost},
completeMove: ${completeMove}
    ''';
  }
}
