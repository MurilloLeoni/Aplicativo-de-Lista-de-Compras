// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var txtValor1;
    String hintText = 'Nova lista';
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Lista'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              '../lib/imagens/comidas.jpg',
              width: 150,
              height: 150,
              alignment: Alignment.topCenter,
            ),
            SizedBox(height: 50),
            Form(
              key: formKey,
              child: TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.list),
                ),
                onChanged: (value) {
                  setState(() {
                    hintText = '';
                  });
                },
              ),
            ),
            SizedBox(height: 300),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 13, 0, 255),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: Size(200, 50),
              ),
              onPressed: () {},
              child: Text(
                'CRIAR',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
