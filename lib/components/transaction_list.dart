// ignore_for_file: prefer_const_constructors

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
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: ((context, index) {
          final e = transactions[index];
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Theme.of(context).copyWith().primaryColor,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${e.valor.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).copyWith().primaryColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('d/MMM/y').format(e.data),
                    style: TextStyle(
                      color: Color.fromARGB(255, 116, 116, 116),
                    ),
                  )
                ],
              )
            ],
          ));
        }),
      ),
    );
  }
}
