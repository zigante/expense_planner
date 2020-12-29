import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;
  NewTransaction(this._addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _currentDate;

  void _submit() {
    final currentTitle = this._titleController.text;
    final currentAmount = double.tryParse(this._amountController.text);

    if (currentTitle.isEmpty || currentAmount <= 0 || currentAmount.isNaN || this._currentDate == null) return;
    widget._addNewTransaction(currentTitle, currentAmount, this._currentDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: this._currentDate == null ? DateTime.now() : this._currentDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((value) => setState(() => this._currentDate = value));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: this._titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: this._amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(this._currentDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data: ${new DateFormat.yMd('pt_BR').format(_currentDate)}'),
                  ),
                  FlatButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Escolha uma data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submit,
              child: Text('Adicionar'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
