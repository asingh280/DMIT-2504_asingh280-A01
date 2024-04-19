// lib/main.dart

import 'package:flutter/material.dart';
import 'package:expense_explorer/screens/expense_log_screen.dart';
import 'package:expense_explorer/screens/insights_screen.dart';
import 'package:expense_explorer/screens/budget_screen.dart';
import 'package:expense_explorer/models/expense.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ExpenseLogScreen(),
        '/insights': (context) => InsightsScreen(expenses: []),
        '/budget': (context) => BudgetScreen(),
      },
    );
  }
}
