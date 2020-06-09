import 'package:mobx/mobx.dart';
part 'Nivel.g.dart';

class Nivel = _Nivel with _$Nivel;

abstract class _Nivel with Store {
  int nivel = 1;
  @observable
  int xp = 0;

  @action
  GiveXP() {
    xp+=100;

    if(xp >= (nivel)*300) {
      nivel++;
    }
  }
}