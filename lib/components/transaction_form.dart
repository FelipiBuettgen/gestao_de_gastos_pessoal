// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();
  final void Function(String, double) onSubmit;
  TransactionForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: titleControler,
            decoration: InputDecoration(
              labelText: "Título",
            ),
          ),
          TextField(
            controller: valueControler,
            decoration: InputDecoration(
              labelText: "Valor (R\$)",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.purple[200]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        side: BorderSide(
                          color: Colors.deepPurple,
                          width: 1,
                        ))),
                    elevation: MaterialStateProperty.all(3)),
                onPressed: () {
                  final value = double.tryParse(valueControler.text) ?? 0.0;
                  onSubmit(titleControler.text, value);
                },
                child: Text(
                  "Nova Transação!",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
