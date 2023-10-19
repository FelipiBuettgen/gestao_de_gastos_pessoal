import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      titulo: 'Conta de internet',
      valor: 120.75,
      data: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      titulo: 'Conta de agua',
      valor: 87.70,
      data: DateTime.now(),
    ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(
          onSubmit: _addTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
