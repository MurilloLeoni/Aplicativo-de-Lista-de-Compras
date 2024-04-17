// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/Anula_view.dart';
import 'view/item_view.dart';
import 'view/lista_view.dart';
import 'view/login_view.dart';
import 'view/password_view.dart';
import 'view/registration_view.dart';
import 'view/sobre_view.dart';
import 'view/start_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'password': (context) => PasswordView(),
        'registration': (context) => RegistrationView(),
        'anula': (context) => AnulaView(),
        'sobre': (context) => SobreView(),
        'lista': (context) => ListaView(),
        'start': (context) => StartView(),
        'item': (context) => ItemView(),
      },
    );
  }
}
