// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'dart:math';
import 'package:bloc_2/bloc/cuadros_bloc.dart';
import 'package:bloc_2/entities/rombo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RomboView extends StatelessWidget {

  final int posicion;
  final Rombo rombo;

  RomboView({
    required this.posicion,
    required this.rombo
  });

  @override
  Widget build( BuildContext context ) {
    return Center(
      child: Transform.rotate(
        angle: - pi / 4,
        child: InkWell(
          onLongPress:() {
             BlocProvider.of<CuadrosBloc>(context).add(ChangeRomboSize(posicion));
          },
          onTap: () {
             BlocProvider.of<CuadrosBloc>(context).add(ChangeRomboColor(posicion));
          },
          onDoubleTap: () {
             BlocProvider.of<CuadrosBloc>(context).add(RemoveRombo(posicion));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: rombo.size,
            height: rombo.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: rombo.color
            ),
            child: Center(child: Text(rombo.name)),
          ),
        ),
      ),
    );
  }
}
