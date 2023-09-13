import 'package:bloc_2/entities/person.dart';
import 'package:flutter/material.dart';

class AlertaImagen extends StatelessWidget {
  final Person persona;

  const AlertaImagen({
    super.key, 
    required this.persona
  });

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      shadowColor: Colors.blue,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500
      ),
      alignment: Alignment.center,
      backgroundColor: Colors.blue[100],
      elevation: 4,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
      title: Center(child: Text(persona.phrase))
    );
  }
}

