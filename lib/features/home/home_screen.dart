import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Lista de personas (sustituye por tus datos reales)
  final List<String> personas = [
    'Juan',
    'María',
    'Pedro',
    'Ana',
    'Luis',
    'Laura',
    'Carlos',
    'Sofía',
    'Diego',
    'Elena',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Personas'),
      ),
      body: ListView.builder(
        itemCount: personas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personas[index]),
            onTap: () {
              // Acción al hacer tap en la persona (opcional)
              print('Tapped ${personas[index]}');
            },
          );
        },
      ),
    );
  }
}