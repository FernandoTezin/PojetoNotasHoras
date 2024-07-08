import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projetonotas/app/database/db.dart';
import 'package:projetonotas/app/myapp.dart';
import 'package:sqflite/sqflite.dart';

class listaMateria extends StatelessWidget {
  const listaMateria({
    super.key,
  });

  Future<List<Map<String, dynamic>>> _buscar() async {
    String path = join(await getDatabasesPath(), 'banco');
    Database db = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(table);
      db.execute(insert);
    });
    return db.query('notas');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var lista = futuro.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Lista de Matérias'),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MyApp.CADASTRO_MATERIA);
                        })
                  ],
                ),
                body: ListView.builder(
                    itemCount: lista!.length,
                    itemBuilder: (context, i) {
                      var notas = lista[i];
                      return ListTile(
                          title: Text(notas['materia']),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.edit), onPressed: null),
                                IconButton(
                                    icon: Icon(Icons.delete), onPressed: null),
                              ],
                            ),
                          ),
                          subtitle: Text(
                              '''1º Tri: ${notas['nota1']}, 2º Tri: ${notas['nota2']}, 3º Tri: ${notas['nota3']},
Média: ${((int.parse(notas['nota1']) + int.parse(notas['nota2']) + int.parse(notas['nota3'])) / 3).round()}'''));
                    }));
          } else {
            return Scaffold();
          }
        });
  }
}
