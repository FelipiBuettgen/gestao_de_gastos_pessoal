// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final value = double.tryParse(valueControler.text) ?? 0.0;
    final title = titleControler.text;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
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
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        side: BorderSide(
                          color: Colors.purple.shade500,
                          width: 0.3,
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
