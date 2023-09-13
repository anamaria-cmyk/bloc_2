import 'package:bloc_2/entities/person.dart';
import 'package:bloc_2/widgets/alerta_imagen.dart';
import 'package:flutter/material.dart';

class TarjetaPersona extends StatelessWidget {

  final int index;
  final Person persona;

  const TarjetaPersona({
    super.key,
    required this.index, 
    required this.persona,
  
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        onTap: () {
          showDialog(
            builder: ( _ ) => AlertaImagen(persona: persona),
            context: context
          );
        },
        child: Container(
          color: Colors.blue[500],
          child: Card(
            child: Column(
              children:[
                Image.network(
                  persona.url,
                  height: 240,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(persona.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                const Spacer(
                  flex: 9,
                ),
                Text(persona.phrase),
                const Spacer(
                  flex: 9,
                ),
              ],
            ) 
          ),
        ),
      ),
    );
  }
}