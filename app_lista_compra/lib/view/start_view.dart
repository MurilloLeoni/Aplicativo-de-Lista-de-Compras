// ignore_for_file: prefer_const_constructors
import 'package:app_lista_compra/view/item_view.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  List<List<String>> allLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTAS'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: allLists.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        allLists[index][0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmação'),
                              content: Text(
                                  'Tem certeza que deseja excluir esta lista?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancelar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      allLists.removeAt(index);
                                    });
                                    Navigator.of(context)
                                        .pop(); // Fecha o pop-up após a exclusão
                                  },
                                  child: Text('Confirmar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemView(
                          listName: allLists[index][0],
                          items: allLists[index].sublist(1)),
                    ),
                  );
                },
              ),
            );
          },
        ),
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
      allLists.add(List.generate(10, (index) => listName));
    });
  }
}
