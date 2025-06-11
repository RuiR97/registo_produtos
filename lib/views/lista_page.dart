import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  final String nomeLista;
  final String user;

  const ListaPage({super.key, required this.nomeLista, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomeLista)),
      body:
          Center(child: Text('Página da lista: $nomeLista\nUtilizador: $user')),
    );
  }
}
