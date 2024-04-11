// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela início'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: Column(
        //Alinhamento EIXO PRINCIPAL
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Image.asset(
            '../lib/imagens/carrinho.jpg',
            width: 200,
            height: 200,
            alignment: Alignment.topCenter,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.list),
                    label: Text('Listas'),
                  ),
                  width: 100,
                  height: 50,
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                  context,
                  'sobre',
                );
                    },
                    icon: Icon(Icons.info),
                    label: Text('Sobre'),
                  ),
                  width: 100,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
