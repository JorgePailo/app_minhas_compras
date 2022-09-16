import 'package:app_minhas_compras/model/Produtos.dart';
import 'package:app_minhas_compras/util/ProdutosHelpers.dart';
import 'package:flutter/material.dart';

class tela_Cad_Prod extends StatefulWidget {
  const tela_Cad_Prod({Key? key}) : super(key: key);

  @override
  State<tela_Cad_Prod> createState() => _tela_Cad_ProdState();
}

class _tela_Cad_ProdState extends State<tela_Cad_Prod> {
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtfornecedor = TextEditingController();
  TextEditingController txtpreco = TextEditingController();

  // aula 61 Cadastrando 1 produto no banco de dados ao clicar no meu botao de cadastrar o produto
  // criar uma instancia antes -> ProdutosHelpers db = ProdutosHelpers();

  ProdutosHelpers db = ProdutosHelpers();

  void salvarProduto() async => setState(() async {
        // 1 passo - Criar o objeto Model para pegar os dados da tela

        Produtos obj = Produtos(null, txtnome.text, txtfornecedor.text,
            double.parse(txtpreco.text));
        int resultado = await db.cadastrarProdutos(obj);

        if (resultado != null) {
          print("Cadastrado com sucesso" + resultado.toString());
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Produtos"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: null,
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                      controller: txtnome,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(labelText: "Produto"),
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: txtfornecedor,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(labelText: "Fornecedor"),
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: txtpreco,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(labelText: "Preço"),
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // para mexer num botao melhor colocar no SizedBox
                    height: 40,
                    width: double.infinity, //largura total da tela
                    child: ElevatedButton(
                      child: Text("Adicionar Produto"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, onPrimary: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
