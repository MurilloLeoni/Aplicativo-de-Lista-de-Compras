// ignore_for_file: prefer_const_constructors
import 'package:app_lista_compra/view/item_view.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  String nomeLista = ''; // Variável para armazenar o nome da lista

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela início'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemView(),
            ),
          );
        },
        child: Stack(
          children: [
            nomeLista.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../lib/imagens/carrinho.jpg',
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Você ainda não possui nenhuma lista!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Toque para criar uma nova lista.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      'Lista: $nomeLista', // Exibe o nome da lista
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 21, 0, 255),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(170, 50),
                  ),
                  onPressed: () async {
                    final novaLista = await Navigator.pushNamed(
                      context,
                      'lista',
                    ) as String;

                    setState(() {
                      nomeLista = novaLista;
                    });
                  },
                  child: Text('+ NOVA LISTA'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
