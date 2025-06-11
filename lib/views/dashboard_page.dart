import 'package:flutter/material.dart';
import 'lista_page.dart';

class DashboardPage extends StatelessWidget {
  final String user;
  const DashboardPage({super.key, required this.user});

  void _abrirLista(BuildContext context, String nomeLista) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => ListaPage(nomeLista: nomeLista, user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listas = ['Lista 1', 'Lista 2', 'Lista 3', 'Lista 4'];

    return Scaffold(
      appBar: AppBar(title: const Text('As Minhas Listas')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: listas.map((nome) {
          return GestureDetector(
            onTap: () => _abrirLista(context, nome),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(nome, style: const TextStyle(fontSize: 18))),
            ),
          );
        }).toList(),
      ),
    );
  }
}
