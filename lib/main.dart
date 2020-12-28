import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');
    return MaterialApp(
      home: MyHomePage(),
      title: 'Flutter App',
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 'tx1', title: 'Tênis novo', amount: 299.99, date: DateTime.now()),
    Transaction(id: 'tx2', title: 'Camiseta nova', amount: 79.99, date: DateTime.now()),
    Transaction(id: 'tx3', title: 'Jeans', amount: 119.99, date: DateTime.now()),
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text Control'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                color: Colors.blue,
                child: Text('Chart'),
                width: double.infinity,
              ),
              elevation: 5,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Título'),
                      controller: this.titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Valor'),
                      controller: this.amountController,
                    ),
                    FlatButton(
                        onPressed: () =>
                            this.transactions.add(Transaction(id: null, title: null, amount: null, date: null)),
                        child: Text('Adicionar'),
                        textColor: Colors.purple)
                  ],
                ),
              ),
            ),
            Column(
              children: this
                  .transactions
                  .map(
                    (e) => Card(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                            child: Text(
                              'R\$ ${e.amount}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                new DateFormat.yMMMMd('pt_BR').format(e.date),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
