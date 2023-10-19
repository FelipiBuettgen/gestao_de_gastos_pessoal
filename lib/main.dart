// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Despesas Pessoais", textDirection: TextDirection.ltr)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text('Grafico', textDirection: TextDirection.ltr),
              elevation: 2,
            ),
            Card(
              child:
                  Text("Lista de transações", textDirection: TextDirection.ltr),
              elevation: 2,
            )
          ],
        ),
      ),
    );
  }
}
