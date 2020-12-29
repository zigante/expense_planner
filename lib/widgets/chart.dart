import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/grouped_transaction.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactiontions;
  Chart(this._recentTransactiontions);

  List<GroupTransaction> get groupedTransactions {
    final list = List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0;
      for (int i = 0; i < this._recentTransactiontions.length; i++) {
        // final currentTransactiontions = this._recentTransactiontions[i];

        if (this._recentTransactiontions[i].date.day == weekDay.day &&
            this._recentTransactiontions[i].date.month == weekDay.month &&
            this._recentTransactiontions[i].date.year == weekDay.year) {
          totalAmount += this._recentTransactiontions[i].amount;
        }
      }

      return GroupTransaction(amount: totalAmount, day: DateFormat.E('pt_BR').format(weekDay), index: weekDay.weekday);
    });

    list.sort((a, b) => a.index.compareTo(b.index));
    return list.toList();
  }

  double get maxSpending {
    return groupedTransactions.fold(0.0, (previousValue, element) => element.amount + previousValue);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: (groupedTransactions)
              .map((e) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: e.day,
                      amount: e.amount,
                      percent: maxSpending == 0 ? 0 : e.amount / maxSpending,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
