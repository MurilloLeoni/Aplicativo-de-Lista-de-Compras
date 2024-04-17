// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  final String listName;
  final List<String> items;

  const ItemView({super.key, required this.listName, required this.items});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  List<FoodItem> foodItems = []; // Lista de alimentos

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, // Define o fundo do card como branco
                  child: ListTile(
                    leading: Checkbox(
                      value: foodItems[index].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          foodItems[index].isChecked = value ?? false;
                        });
                      },
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${foodItems[index].name} (Qntd:${foodItems[index].quantity})',
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
                              foodItems.removeAt(index);
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
        String name = foodItems[index].name;
        String quantity = foodItems[index].quantity;

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
                  foodItems[index].name = name;
                  foodItems[index].quantity = quantity;
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
}

class FoodItem {
  String name;
  String quantity;
  bool isChecked;

  FoodItem(
      {required this.name, required this.quantity, this.isChecked = false});
}
