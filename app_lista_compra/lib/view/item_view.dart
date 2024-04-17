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
  final FocusNode _textFocusNode =
      FocusNode(); // Para controlar o foco no campo de texto
  final FocusNode _quantityFocusNode =
      FocusNode(); // Para controlar o foco no campo de quantidade

  @override
  void initState() {
    super.initState();
    // foodItems.addAll(widget.items); // Removido para iniciar com lista vazia
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista ${widget.listName}'.toUpperCase(),
        ),
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
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
                    focusNode: _textFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Digite um alimento',
                    ),
                    onSubmitted: (value) {
                      _textFocusNode
                          .unfocus(); // Remove o foco do campo de texto
                      _quantityFocusNode
                          .requestFocus(); // Dá foco ao campo de quantidade
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 80.0,
                  child: TextField(
                    focusNode: _quantityFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Qtd',
                    ),
                    onSubmitted: (value) {
                      _addFoodItem(_textEditingController.text,
                          value); // Adiciona o alimento
                      _textEditingController.clear(); // Limpa o campo de texto
                      _textFocusNode
                          .requestFocus(); // Dá foco novamente ao campo de texto
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
                            '${foodItems[index].name} (${foodItems[index].quantity})',
                            style: TextStyle(fontSize: 18),
                          ),
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
                onSubmitted: (value) {
                  quantity =
                      value; // Quando o usuário pressionar "Enter", define a quantidade
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
}

class FoodItem {
  final String name;
  final String quantity;
  bool isChecked;

  FoodItem(
      {required this.name, required this.quantity, this.isChecked = false});
}
