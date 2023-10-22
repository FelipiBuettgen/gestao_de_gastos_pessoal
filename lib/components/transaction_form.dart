// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();
  DateTime? _selectdate = DateTime.now();

  _submitForm() {
    final value = double.tryParse(_valueControler.text) ?? 0.0;
    final title = _titleControler.text;
    if (title.isEmpty || value <= 0 || _selectdate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectdate!);
  }

  _showDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _selectdate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _titleControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: "Título",
            ),
          ),
          TextField(
            controller: _valueControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: "Valor (R\$)",
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          Row(
            children: [
              Text(_selectdate == null
                  ? "Nenhuma data selecionada!"
                  : DateFormat('d/M/y').format(_selectdate!)),
              TextButton(
                  onPressed: _showDatepicker,
                  child: Text(
                    "Selecionar Data",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        side: BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ))),
                    elevation: MaterialStateProperty.all(3)),
                onPressed: _submitForm,
                child: Text(
                  "Nova Transação!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
