part of 'cuadros_bloc.dart';

sealed class CuadrosEvent {}

class AddRombo extends CuadrosEvent{

}

class RemoveRombo extends CuadrosEvent{
  final int index;
  RemoveRombo(this.index);
}

class ChangeRomboColor extends CuadrosEvent{
  final int index;
  ChangeRomboColor(this.index);
}

class ChangeRomboSize extends CuadrosEvent{
  final int index;
  ChangeRomboSize(this.index);
}