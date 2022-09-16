import 'package:app_minhas_compras/screens/tela_cad_prod.dart';
import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 170,
            color: Colors.blueGrey,
            child: Center(
              child: Column(
                children: [
                  ///SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 210,
                    height: 50,
                    color: Colors.blue,
                    child: Column(children: [
                      Text("Desenvolvido por:",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(height: 10),
                      Text("NewConect Software LTDA",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Minha Lista de Compras",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
            title: Text("Novo Produto", style: TextStyle(fontSize: 16)),
            onTap: () {
              print("Clicou no menu Novo Produto");
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (Context) => tela_Cad_Prod()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.food_bank,
              color: Colors.blueGrey,
            ),
            title: Text(
              "Meus Produtos",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
