// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AnulaView extends StatefulWidget {
  const AnulaView({super.key});

  @override
  State<AnulaView> createState() => _AnulaViewState();
}

class _AnulaViewState extends State<AnulaView> {
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 21, 0, 255),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              minimumSize: Size(170, 50),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                'lista',
              );
            },
            child: Text('+ NOVA LISTA'),
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
