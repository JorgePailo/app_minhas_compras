import 'dart:io';
import 'package:app_minhas_compras/model/Produtos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProdutosHelpers {
// aqui e criado a partir do 3º passo esse atributos
// Atributos
  static Database _database = _database;

// 4 passo aqui a partir do 4º no caso padrao de projeto singleton
// vamos criar um atributo statico
  //--------------------------------------------------
  static ProdutosHelpers _databasehelper = _databasehelper;
// aqui no caso não vai deixar criar outro objeto

  ProdutosHelpers._createInstance();
  factory ProdutosHelpers() {
    //construtor
    if (_databasehelper == null) {
      _databasehelper = ProdutosHelpers._createInstance();
    }
    return _databasehelper;
  }
//----------------------------------------------------
// 1 passo nop caso do banco SQÇLite temos que criar a  estrutura da nossa tabela aqui
  String nomeTabela = 'tb_produtos';

  String colunaID = 'id';
  String colunanome = 'nome';
  String colunaforn = 'fornecedor';
  String colunapreco = 'preco';
// 1.1 passo para (metodo)criar  o banco - async que demora no caso esta criando e depende da velociade da maquina
  void _criarBanco(Database db, int version) async {
    // aqui para facilitar digita aspas dupla 3 vezes e de pois + 3 vezes
    String sql = """ CREATE TABLE $nomeTabela(
      $colunaID INTERDER PRIMARY KEY AUTOINCREMENT,
      $colunanome Text,
      $colunaforn Text,
      $colunapreco float
      )
      """;
    await db.execute(sql);
  }

  // 2 passo Criar um metodo que inicializa um banco de dados
  // metodo que inicializa o banco, está funcão e do tipo Future
  // vai retornar um objeto do tipo data base
  Future<Database> inicializaBanco() async {
    // pegar o caminho do android ou ios para salvar o banco de dados
    // para poder salvar no celular e pegar o caminho certo, vamos ter que usar uma biblioteca
    // geralmente ele já faz o import
    Directory directory = await getApplicationDocumentsDirectory();
    // crair uma varialvel caminho que vai receber o directory.path + o caminho + nome do meu banco
    String caminho = directory.path + 'bdprodutos.bd';
    // local que eu vou utilizar para poder salvar o meu banco de dados + o nome do meu banco de dados
    var bancodedados =
        await openDatabase(caminho, version: 1, onCreate: _criarBanco);
    // crair a vairavel que vai receber o openDatabase (que vai abrir a conexcao e vai crair nosso banco)
    // preciso passar o caminho, a versao e o onCreate: e a função _criarBanco
    return bancodedados;
  }

// 3 passo crair o metodo que verifica se o banco foi inicializado
  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }
    return _database;
  }

// 5 metodos  CRUD
// create, read, upgrade e delete
// 1 (5) CAdastrar Produtos
  Future<int> cadastrarProdutos(Produtos obj) async {
// 1 passo - selecionar o banco
    Database db = await this.database;
    var resposta = await db.insert(nomeTabela, obj.toMap());

    return resposta;
  }
}
