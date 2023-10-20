// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gestao_de_gastos_pessoal/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sem transações",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: ((context, index) {
                final e = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('R\$${e.valor}')),
                      ),
                      radius: 30,
                    ),
                    title: Text(e.titulo,
                        style: TextStyle(
                            fontFamily: 'Exo2', fontWeight: FontWeight.bold)),
                    subtitle: Text(DateFormat('d/MMM/y').format(e.data)),
                  ),
                );
              }),
            ),
    );
  }
}
