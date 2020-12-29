import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;
  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: this._transactions.isEmpty
          ? Column(children: [
              Text('Nenhuma transação'),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (_context, _index) {
                final currentTransaction = this._transactions[_index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('R\$ ${currentTransaction.amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(currentTransaction.title, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(new DateFormat.yMMMMd('pt_BR').format(currentTransaction.date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTransaction(currentTransaction.id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: this._transactions.length,
            ),
    );
  }
}
