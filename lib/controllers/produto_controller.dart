import '../models/produto.dart';
import '../models/produto_database.dart';

class ProdutoController {
  Future<List<Produto>> carregarProdutos() async {
    return await ProdutoDatabase.listarProdutos();
  }

  Future<void> adicionarProduto(
      String nome, double preco, String descricao) async {
    final produto = Produto(nome: nome, preco: preco, descricao: descricao);
    await ProdutoDatabase.inserirProduto(produto);
  }

  Future<void> alternarComprado(Produto produto) async {
    final atualizado = Produto(
      id: produto.id,
      nome: produto.nome,
      preco: produto.preco,
      descricao: produto.descricao,
      comprado: !produto.comprado,
    );
    await ProdutoDatabase.atualizarProduto(atualizado);
  }
}
