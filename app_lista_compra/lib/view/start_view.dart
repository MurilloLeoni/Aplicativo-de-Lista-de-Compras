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
        backgroundColor: Color.fromARGB(255, 37, 255, 25),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: allLists.length,
          itemBuilder: (context, index) {
            String listName = allLists[index][0];
            List<String> items = allLists[index].sublist(1);

            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        listName.toUpperCase(),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _renameListDialog(context, index, listName);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _confirmDeleteListDialog(context, index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemView(
                        listName: listName,
                        items: items,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Clique no botão ao lado\n para criar suas listas!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {
              _createNewListDialog(context);
            },
            backgroundColor: const Color.fromARGB(255, 108, 105, 105),
            foregroundColor: Color.fromARGB(
                255, 255, 255, 255), // Altera a cor do botão para vermelho
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _renameListDialog(BuildContext context, int index, String currentName) {
    String newName = currentName;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Novo Nome da Lista'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            controller: TextEditingController(text: currentName),
            decoration:
                InputDecoration(hintText: 'Digite o novo nome da lista'),
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
                if (newName.isNotEmpty && newName != currentName) {
                  _renameList(index, newName);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _renameList(int index, String newName) {
    setState(() {
      allLists[index][0] = newName;
    });
  }

  void _confirmDeleteListDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Tem certeza que deseja excluir esta lista?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteList(index);
                Navigator.of(context).pop(); // Fecha o pop-up após a exclusão
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteList(int index) {
    setState(() {
      allLists.removeAt(index);
    });
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
      allLists.add([listName]);
    });
  }
}
