class Produto {
  final int? id;
  final String nome;
  final double preco;
  final String descricao;
  final bool comprado;

  Produto({
    this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    this.comprado = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'descricao': descricao,
      'comprado': comprado ? 1 : 0,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      preco: map['preco'],
      descricao: map['descricao'],
      comprado: map['comprado'] == 1,
    );
  }
}
