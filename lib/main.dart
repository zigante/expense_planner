import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import './widgets/transactions.dart';

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
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(color: Colors.blue, child: Text('Chart'), width: double.infinity),
              elevation: 5,
            ),
            Transactions()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
