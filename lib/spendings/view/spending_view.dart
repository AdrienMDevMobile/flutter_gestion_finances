import 'package:flutter/material.dart';
import 'spending_create_bar.dart';
import 'spendings_list.dart';

class SpendingView extends StatelessWidget {
  /// {@macro counter_view}
  const SpendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(children: <Widget>[SpendingsList(), SpendingCreateBar()]),
      ),
    );
  }
}
