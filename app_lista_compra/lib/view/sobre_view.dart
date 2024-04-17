// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOBRE'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 255, 25),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: const [
              TextSpan(
                text: '•Objetivo:\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Criar um aplicativo de lista para te ajudar a organizar melhor suas compras e não esquecer nada na hora das compras!\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              WidgetSpan(
                child: SizedBox(height: 50), // Espaçamento entre as frases
              ),
              TextSpan(
                text: '•Desenvolvimento:\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Este aplicativo foi desenvolvido pela linguagem dart, através do framework flutter.\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              WidgetSpan(
                child: SizedBox(height: 50), // Espaçamento entre as frases
              ),
              TextSpan(
                text: '•Autor:\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Desenvolvido por: Murillo Leoni.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
