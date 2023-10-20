// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:gestao_de_gastos_pessoal/components/chart.dart';
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
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.data.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

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
            Chart(recentTransactions: _recentTransactions),
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
