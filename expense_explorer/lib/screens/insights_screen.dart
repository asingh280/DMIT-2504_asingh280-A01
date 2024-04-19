// lib/screens/insights_screen.dart

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:expense_explorer/models/expense.dart';

class InsightsScreen extends StatelessWidget {
  final List<Expense> expenses;

  InsightsScreen({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: charts.TimeSeriesChart(
            _createSampleData(),
            animate: true,
          ),
        ),
      ),
    );
  }

  List<charts.Series<Expense, DateTime>> _createSampleData() {
    List<charts.Series<Expense, DateTime>> seriesList = [
      charts.Series<Expense, DateTime>(
        id: 'Expenses',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Expense expense, _) => expense.date,
        measureFn: (Expense expense, _) => expense.amount,
        data: expenses,
      ),
    ];
    return seriesList;
  }
}
