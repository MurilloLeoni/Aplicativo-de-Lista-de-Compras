// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AnulaView extends StatefulWidget {
  const AnulaView({super.key});

  @override
  State<AnulaView> createState() => _AnulaViewState();
}

class _AnulaViewState extends State<AnulaView> {
  List<List<String>> allLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela início'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: ListView.builder(
        itemCount: allLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    allLists[index][0]
                        .toUpperCase(), // Converte para letras maiúsculas
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight:
                            FontWeight.bold), // Negrito e tamanho da fonte
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      allLists.removeAt(
                          index); // Remove a lista quando o ícone é pressionado
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListScreen(items: allLists[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNewListDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _createNewListDialog(BuildContext context) {
    String listName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nome da Lista'),
          content: TextField(
            onChanged: (value) {
              listName = value;
            },
            decoration: InputDecoration(hintText: 'Digite o nome da lista'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (listName.isNotEmpty) {
                  _createNewList(listName);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
  }

  void _createNewList(String listName) {
    setState(() {
      allLists
          .add(List.generate(10, (index) => '• $listName'));
    });
  }
}

class ListScreen extends StatelessWidget {
  final List<String> items;

  const ListScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items[0]), // O título da AppBar é o nome da lista
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: ListView.builder(
        itemCount:
            items.length - 1, // Ignora o primeiro item que é o nome da lista
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[
                index + 1]), // Exibe os itens da lista, ignorando o primeiro
            onTap: () {
              // Adicione aqui o que deseja fazer quando um item é selecionado
              print('Item ${items[index + 1]} selecionado');
            },
          );
        },
      ),
    );
  }
}
