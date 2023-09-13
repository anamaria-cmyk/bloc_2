import 'package:bloc/bloc.dart';
import 'package:bloc_2/entities/person.dart';
import 'package:bloc_2/entities/rombo.dart';
import 'package:flutter/material.dart';
import './fake_persons.dart' as fake_persons;

part 'cuadros_event.dart';
part 'cuadros_state.dart';

class CuadrosBloc extends Bloc<CuadrosEvent, CuadrosState> {
  static const _color1 = Color.fromARGB(255, 23, 169, 241);
  static const _color2 = Color.fromARGB(255, 237, 72, 127);
  static const _width1 = 75.0;
  static const _width2 = 150.0;
  CuadrosBloc() : super(CuadrosState(
    diamonds: [],
    persons: fake_persons.persons
  )) {
    on<CuadrosEvent>((event, emit) {
      if(event is AddRombo){
        emit(CuadrosState(
          diamonds: [
            ...state.diamonds,
            Rombo(
              name: 'Rombo ${state.diamonds.length + 1}',
              color: _color1,
              size: _width1
            )
          ],
          persons: state.persons
        ));
      }else if(event is RemoveRombo){
        final updatedRombos = List<Rombo>.from(state.diamonds);
        updatedRombos.removeAt(event.index);
        emit(CuadrosState(
          diamonds: updatedRombos,
          persons: state.persons
        ));
      }else if(event is ChangeRomboColor){
        final updatedRombos = List<Rombo>.from(state.diamonds);
        final initRombo = updatedRombos[event.index];
        updatedRombos[event.index] = Rombo(
          name: initRombo.name,
          color: initRombo.color.blue  == _color1.blue?
            _color2:
            _color1,
          size: initRombo.size
        );
        emit(CuadrosState(
          diamonds: updatedRombos,
          persons: state.persons
        ));
      }else if(event is ChangeRomboSize){
        final updatedRombos = List<Rombo>.from(state.diamonds);
        final initRombo = updatedRombos[event.index];
        updatedRombos[event.index] = Rombo(
          name: initRombo.name,
          color: initRombo.color,
          size: initRombo.size == _width1?
            _width2 : _width1
        );
        emit(CuadrosState(
          diamonds: updatedRombos,
          persons: state.persons
        ));
      }
    });
  }
}
