import 'package:flutter/material.dart';

class ListaWeb extends StatefulWidget {
  const ListaWeb({Key? key}) : super(key: key);

  @override
  _ListaWebState createState() => _ListaWebState();
}

class _ListaWebState extends State<ListaWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Web'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(

      ),
    );
  }
}
