// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gestao_de_gastos_pessoal/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameday = recentTransactions[i].data.day == weekDay.day;
        bool samemonth = recentTransactions[i].data.month == weekDay.month;
        bool sameyear = recentTransactions[i].data.year == weekDay.year;

        if (sameyear && samemonth && sameday) {
          totalSum += recentTransactions[i].valor;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((e) {
          return Text('${e['day']}:${e['value']}');
        }).toList(),
      ),
    );
  }
}
