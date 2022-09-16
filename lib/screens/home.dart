import 'package:app_minhas_compras/screens/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP NewConect Software!"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      drawer: menuDrawer(),
    );
  }
}
