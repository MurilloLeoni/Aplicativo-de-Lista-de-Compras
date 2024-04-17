// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 255, 25),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'sobre');
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 143, 143, 143),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'start',
                  );
                },
                child: Text('LOGIN'),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'password',
                  );
                },
                child: Text('Esqueceu a senha?'),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'registration');
                },
                child: Text('Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
