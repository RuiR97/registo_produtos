import 'package:flutter/material.dart';
import 'views/produto_page.dart';

void main() {
  runApp(const RegistoProdutosApp());
}

class RegistoProdutosApp extends StatelessWidget {
  const RegistoProdutosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registo de Produtos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProdutoPage(),
    );
  }
}
