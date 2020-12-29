import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percent;
  ChartBar({this.label, this.amount, this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('R\$ ${this.amount.toStringAsFixed(0)}')),
        ),
        SizedBox(height: 4),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 200, 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: this.percent,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            )),
        SizedBox(height: 4),
        Text(this.label),
      ],
    );
  }
}
