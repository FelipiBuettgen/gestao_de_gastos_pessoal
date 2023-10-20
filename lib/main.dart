// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';
import 'dart:math';
import 'components/transaction_list.dart';

void main() {
  final ThemeData tema = ThemeData();
  runApp(MaterialApp(
    home: App(),
    theme: ThemeData(
            fontFamily: 'Exo2',
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 25,
                fontFamily: 'Exo2',
                fontWeight: FontWeight.w800,
              ),
            ))
        .copyWith(
            colorScheme: tema.colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.amber)),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   titulo: 'Conta de internet',
    //   valor: 120.75,
    //   data: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   titulo: 'Conta de agua',
    //   valor: 87.70,
    //   data: DateTime.now(),
    // ),
  ];
  _addTransaction(String title, double value) {
    final newTrasaction = Transaction(
        id: Random().nextDouble().toString(),
        titulo: title,
        valor: value,
        data: DateTime.now());
    setState(() {
      _transactions.add(newTrasaction);
    });
    Navigator.of(context).pop();
  }

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: [
          IconButton(
              onPressed: () => _openTransactionModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text('Grafico'),
              elevation: 2,
              color: Colors.greenAccent,
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
