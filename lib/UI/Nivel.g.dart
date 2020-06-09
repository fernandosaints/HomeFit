// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nivel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Nivel on _Nivel, Store {
  final _$xpAtom = Atom(name: '_Nivel.xp');

  @override
  int get xp {
    _$xpAtom.reportRead();
    return super.xp;
  }

  @override
  set xp(int value) {
    _$xpAtom.reportWrite(value, super.xp, () {
      super.xp = value;
    });
  }

  final _$_NivelActionController = ActionController(name: '_Nivel');

  @override
  dynamic GiveXP() {
    final _$actionInfo =
        _$_NivelActionController.startAction(name: '_Nivel.GiveXP');
    try {
      return super.GiveXP();
    } finally {
      _$_NivelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
xp: ${xp}
    ''';
  }
}
