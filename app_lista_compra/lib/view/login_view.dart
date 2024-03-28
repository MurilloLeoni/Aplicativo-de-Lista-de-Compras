// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              //
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: txtValor1,

                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.man),
                ),
                //
                // VALIDAÇÃO
                //
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um CPF';
                  } else if (value.length != 11 ||
                      int.tryParse(value) == null) {
                    return 'Informe um CPF válido com 11 números';
                  }
                  // Retornar null significa sucesso na validação
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: _obscureText,
                controller: txtValor2,
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
              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  minimumSize: Size(200, 50),
                  shadowColor: Colors.red,
                ),
                onPressed: () {
                  //
                  // Chamar os validadores dos campos de texto
                  //
                  if (formKey.currentState!.validate()) {
                    //Form validado com sucesso
                  }
                },
                child: Text('LOGIN'),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: Text('Esqueceu a senha?'),
              ),

              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: Text('Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
