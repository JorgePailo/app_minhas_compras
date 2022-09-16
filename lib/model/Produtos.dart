import 'package:flutter/material.dart';

class Produtos {
//Atributos
  int? id;
  String? nome;
  String? fornecedor;
  double? preco;

//Construtor
  Produtos(this.id, this.nome, this.fornecedor, this.preco);
//metodos
// fluxo de ida
//metodo que converter um model para map
  Map<String, dynamic> toMap() {
    //1 passo -> é criar o map que vai ser retornado
    var dados = Map<String, dynamic>();
    //2 passo -> é guardar os dados dos atrubutos no map
    dados['id'] = id;
    dados['nome'] = nome;
    dados['fornecedor'] = fornecedor;
    dados['preco'] = preco;
    return dados;
  }

// fluxo de volta
//metodo que converter um map para model
  Produtos.deMapParaModel(Map<String, dynamic> dados) {
    this.id = dados['id'];
    this.nome = dados['nome'];
    this.fornecedor = dados['fornecedor'];
    this.preco = dados['preco'];
  }
}
