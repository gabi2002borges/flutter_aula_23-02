import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ListaWeb extends StatefulWidget {
  const ListaWeb({Key? key}) : super(key: key);

  @override
  _ListaWebState createState() => _ListaWebState();
}

class _ListaWebState extends State<ListaWeb> {
  Future<List> getDados() async {
    var url = await Uri.parse('https://jsonplaceholder.typicode.com/users');
    var resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      return convert.jsonDecode(resposta.body);
    } else {
      throw('Erro ao consultar dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Web'), backgroundColor: Colors.deepPurple,),
      body: FutureBuilder<List>(
        future: getDados(),
        builder: (contexto, snapshot) {
          if (snapshot.hasError) {
            return Text('Deu ruim');
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, indice) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          Icon(
                            Icons.person, size: 50,),
                          Text('Meu nome', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      trailing: TextButton(
                        child: Text('Teste'), onPressed: () {
                        print("Apertou no botão");
                      },
                      ),
                      onTap: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Icon(Icons.warning),
                                Text('Excluir'),
                              ],
                            ),
                            titlePadding: EdgeInsets.all(30),
                            content: Text(
                                'Excluir ${snapshot.data![indice]['name']}'),
                            contentPadding: EdgeInsets.all(60),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.pop(context)
                              }, child: Text('Sim')),
                              TextButton(onPressed: () {
                                Navigator.pop(context)
                              }, child: Text('Não')),
                            ],
                          );
                        });
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${snapshot.data![indice]['id']}'),
                          Text('Nome: ${snapshot.data![indice]['name']}'),
                          Text('Rua: ${snapshot
                              .data![indice]['address']['street']}'),
                          Text('CEP: ${snapshot
                              .data![indice]['address']['zipcode']}'),
                        ],
                      ),
                      subtitle: Text(
                          'E-mail: ${snapshot.data![indice]['email']}'),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
