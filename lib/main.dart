import 'package:aula23_02/Cadastro.dart';
import 'package:aula23_02/Lista.dart';
import 'package:aula23_02/ListaWeb.dart';
import 'package:aula23_02/Login.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/lista': (context) => Lista(),
      '/cadastro': (context) => Cadastro(),
      '/listaweb': (context) => ListaWeb(),
      '/login': (context) => Login(),
    },
    home: Login(),
  ));
}
