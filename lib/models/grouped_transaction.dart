import 'package:flutter/material.dart';

class GroupTransaction {
  final String day;
  final double amount;
  final int index;

  GroupTransaction({
    @required this.day,
    @required this.amount,
    @required this.index,
  });
}
