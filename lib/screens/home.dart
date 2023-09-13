import 'package:bloc_2/bloc/cuadros_bloc.dart';
import 'package:bloc_2/widgets/rombo_view.dart';
import 'package:bloc_2/widgets/tarjeta_persona.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  final cuadrosBloc = CuadrosBloc();
  HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth  = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => cuadrosBloc,
      child: Scaffold(
        body: BlocBuilder<CuadrosBloc, CuadrosState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.51,
                  child: ListView.builder(
                    itemCount: state.diamonds.length,
                    itemBuilder:  (_, index) => RomboView(posicion: index, rombo: state.diamonds[index])
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MaterialButton(
                    elevation: 2,
                    textColor: const Color.fromARGB(255, 255, 233, 233),
                    color: const Color.fromARGB(255, 234, 13, 87),
                    child: const Text('Agregar Rombo'),
                    onPressed: () {
                      cuadrosBloc.add(AddRombo());
                    }
                  ),
                ),
                SizedBox(
                  width: screenwidth,
                  height: screenHeight * 0.36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ( _, index) => TarjetaPersona(index: index, persona: state.persons[index]) ,
                    itemCount: state.persons.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
