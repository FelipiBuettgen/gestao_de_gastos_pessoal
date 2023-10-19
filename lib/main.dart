// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:gestao_de_gastos_pessoal/components/transaction_user.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Despesas Pessoais")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Text('Grafico'),
                elevation: 2,
                color: Colors.greenAccent,
              ),
              TransactionUser()
            ],
          ),
        ),
      ),
    );
  }
}
