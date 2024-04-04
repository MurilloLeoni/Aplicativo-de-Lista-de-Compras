// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenha2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 13, 255),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: txtEmail,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Digite seu e-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: txtNome,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Digite seu nome',
                  prefixIcon: Icon(Icons.man),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: _obscureText,
                controller: txtSenha,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: _obscureText,
                controller: txtSenha2,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              //
              // BOTÃO
              //
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 143, 143, 143),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text('Cadastrar'),
              ),
              SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
