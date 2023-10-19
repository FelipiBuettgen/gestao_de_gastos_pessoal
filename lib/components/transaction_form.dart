// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();
  final void Function(String, double) onSubmit;
  TransactionForm({super.key, required this.onSubmit});
  _submitForm() {
    final value = double.tryParse(valueControler.text) ?? 0.0;
    final title = titleControler.text;
    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: titleControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: "Título",
            ),
          ),
          TextField(
            controller: valueControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: "Valor (R\$)",
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                onPressed: _submitForm,
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
