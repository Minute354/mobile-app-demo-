import 'package:flutter/material.dart';

import '../common_widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          CardWidget(icon: Icons.account_balance_wallet, title: 'Fee Summary'),
          CardWidget(icon: Icons.payment, title: 'Fee Paid Details'),
          CardWidget(icon: Icons.school, title: 'Classes Info'),
          CardWidget(icon: Icons.calendar_today, title: 'Exams Schedule'),
        ],
      ),
    );
  }
}