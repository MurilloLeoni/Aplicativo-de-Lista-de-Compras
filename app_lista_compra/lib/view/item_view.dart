// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('teste'), //ModalRoute.of(context).settings.arguments),
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 50, 30, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              child: Text(
                '+ ADICIONAR',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
