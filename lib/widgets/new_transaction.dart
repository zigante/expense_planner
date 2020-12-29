import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  void submit() {
    final currentTitle = this._titleController.text;
    final currentAmount = double.parse(this._amountController.text);

    if (currentTitle.isEmpty || currentAmount <= 0 || currentAmount.isNaN) return;
    _addNewTransaction(currentTitle, currentAmount);
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
              onSubmitted: (_) => submit(),
            ),
            FlatButton(onPressed: submit, child: Text('Adicionar'), textColor: Colors.purple)
          ],
        ),
      ),
    );
  }
}
