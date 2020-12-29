import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _transactions = [
    Transaction(id: 'tx1', title: 'Tênis novo', amount: 299.99, date: DateTime.now()),
    Transaction(id: 'tx2', title: 'Camiseta nova', amount: 79.99, date: DateTime.now()),
    Transaction(id: 'tx3', title: 'Jeans', amount: 119.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: new DateTime.now(),
      id: 'tx${this._transactions.length + 1}',
    );

    setState(() {
      this._transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(this._transactions),
    ]);
  }
}
