import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../controllers/produto_controller.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({super.key});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final ProdutoController _controller = ProdutoController();

  List<Produto> _produtos = [];

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    final produtos = await _controller.carregarProdutos();
    setState(() {
      _produtos = produtos;
    });
  }

  Future<void> _adicionarProduto() async {
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final descricao = _descricaoController.text;

    if (nome.isEmpty) return;

    await _controller.adicionarProduto(nome, preco, descricao);
    _nomeController.clear();
    _precoController.clear();
    _descricaoController.clear();
    _carregarProdutos();
  }

  Future<void> _alternarComprado(Produto produto) async {
    await _controller.alternarComprado(produto);
    _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registo de Produtos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome')),
            TextField(
                controller: _precoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Preço')),
            TextField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _adicionarProduto,
                child: const Text('Adicionar Produto')),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _produtos.length,
                itemBuilder: (context, index) {
                  final produto = _produtos[index];
                  return ListTile(
                    title: Text(produto.nome),
                    subtitle: Text(
                        '${produto.preco.toStringAsFixed(2)} €\n${produto.descricao}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: Icon(produto.comprado
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                      onPressed: () => _alternarComprado(produto),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
