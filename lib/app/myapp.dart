import 'package:flutter/material.dart';
import 'package:projetonotas/app/view/materiaForm.dart';
import 'package:projetonotas/app/view/materiaLista.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const HOME = '/';
  static const CADASTRO_MATERIA = 'contact-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HOME: (context) => listaMateria(),
        CADASTRO_MATERIA: (context) => cadastroMateria()
      },
    );
  }
}
