// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  final String listName;
  final List<String> items;

  const ItemView({Key? key, required this.listName, required this.items})
      : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  List<FoodItem> foodItems = []; // Lista de alimentos
  List<FoodItem> filteredItems = []; // Lista de alimentos filtrados

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicialize foodItems com base nos items passados
    for (String item in widget.items) {
      foodItems.add(FoodItem(name: item, quantity: ''));
    }
    filteredItems
        .addAll(foodItems); // Inicialize filteredItems com base em foodItems
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista ${widget.listName}'.toUpperCase(),
        ),
        backgroundColor: Color.fromARGB(255, 37, 255, 25),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: FoodItemSearch(foodItems));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Digite um alimento',
                    ),
                    onSubmitted: (value) {},
                  ),
                ),
                SizedBox(width: 8.0),
                SizedBox(
                  width: 80.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Qtd',
                    ),
                    onSubmitted: (value) {
                      _addFoodItem(_textEditingController.text,
                          value); // Adiciona o alimento
                      _textEditingController.clear();
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _addFoodItemWithQuantityDialog(); // Chama o diálogo para adicionar o alimento com quantidade
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, // Define o fundo do card como branco
                  child: ListTile(
                    leading: Checkbox(
                      value: filteredItems[index].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          filteredItems[index].isChecked = value ?? false;
                        });
                      },
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${filteredItems[index].name} (Qntd:${filteredItems[index].quantity})',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editFoodItem(index); // Editar o item
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              filteredItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addFoodItem(String name, String quantity) {
    if (name.isNotEmpty && quantity.isNotEmpty) {
      setState(() {
        foodItems.add(FoodItem(name: name, quantity: quantity));
        // Se o item passar no filtro atual, adicione-o aos itens filtrados também
        if (_passesFilter(name)) {
          filteredItems.add(FoodItem(name: name, quantity: quantity));
        }
      });
    }
  }

  void _addFoodItemWithQuantityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        String quantity = '';

        return AlertDialog(
          title: Text('Adicionar Alimento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Nome do Alimento',
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                ),
                onChanged: (value) {
                  quantity = value;
                },
              ),
            ],
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
                _addFoodItem(name, quantity);
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _editFoodItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = filteredItems[index].name;
        String quantity = filteredItems[index].quantity;

        return AlertDialog(
          title: Text('Editar Alimento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome do Alimento',
                ),
                controller: TextEditingController(text: name),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                ),
                controller: TextEditingController(text: quantity),
                onChanged: (value) {
                  quantity = value;
                },
              ),
            ],
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
                setState(() {
                  filteredItems[index].name = name;
                  filteredItems[index].quantity = quantity;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Função para verificar se um item passa pelo filtro atual
  bool _passesFilter(String name) {
    String filterText = _textEditingController.text.toLowerCase();
    return name.toLowerCase().contains(filterText);
  }
}

class FoodItem {
  String name;
  String quantity;
  bool isChecked;

  FoodItem(
      {required this.name, required this.quantity, this.isChecked = false});
}

// Classe para controlar a pesquisa de itens
class FoodItemSearch extends SearchDelegate<FoodItem> {
  final List<FoodItem> foodItems;

  FoodItemSearch(this.foodItems);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '' as FoodItem);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<FoodItem> results = foodItems
        .where((foodItem) =>
            foodItem.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<FoodItem> suggestions = foodItems
        .where((foodItem) =>
            foodItem.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return _buildSearchResults(suggestions);
  }

  Widget _buildSearchResults(List<FoodItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final FoodItem item = items[index];
        return ListTile(
          title: Text('${item.name} (Qntd:${item.quantity})'),
          onTap: () {
            close(context, item);
          },
        );
      },
    );
  }
}
