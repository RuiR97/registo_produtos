import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'produto.dart';

class ProdutoDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'produtos.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            preco REAL,
            descricao TEXT,
            comprado INTEGER
          )
        ''');
      },
    );
    return _database!;
  }

  static Future<void> inserirProduto(Produto produto) async {
    final db = await database;
    await db.insert('produtos', produto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Produto>> listarProdutos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('produtos');
    return List.generate(maps.length, (i) => Produto.fromMap(maps[i]));
  }

  static Future<void> atualizarProduto(Produto produto) async {
    final db = await database;
    await db.update(
      'produtos',
      produto.toMap(),
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }
}
