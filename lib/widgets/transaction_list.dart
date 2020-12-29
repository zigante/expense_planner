import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('R\$ ${currentTransaction.amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(currentTransaction.title, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(new DateFormat.yMMMMd('pt_BR').format(currentTransaction.date)),
                    // trailing: IconButton(
                    //   icon: Icon(Icons.delete),
                    //   onPressed: () => null,
                    //   color: Colors.red,
                    // ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                //         child: Text(
                //           'R\$ ${currentTransaction.amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             currentTransaction.title,
                //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //           ),
                //           Text(
                //             new DateFormat.yMMMMd('pt_BR').format(currentTransaction.date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: this._transactions.length,
            ),
    );
  }
}
