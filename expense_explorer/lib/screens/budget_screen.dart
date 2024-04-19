// lib/screens/budget_screen.dart

import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  Map<String, double> budgetMap = {
    'Groceries': 0.0,
    'Utilities': 0.0,
    'Dining Out': 0.0,
  };

  // Controller for text field inputs
  TextEditingController _groceriesController = TextEditingController();
  TextEditingController _utilitiesController = TextEditingController();
  TextEditingController _diningOutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing budget values (if any)
    _groceriesController.text = budgetMap['Groceries']?.toString() ?? '';
    _utilitiesController.text = budgetMap['Utilities']?.toString() ?? '';
    _diningOutController.text = budgetMap['Dining Out']?.toString() ?? '';
  }

  void _saveBudget() {
    setState(() {
      // Update budgetMap with new values from text fields
      budgetMap['Groceries'] = double.tryParse(_groceriesController.text) ?? 0.0;
      budgetMap['Utilities'] = double.tryParse(_utilitiesController.text) ?? 0.0;
      budgetMap['Dining Out'] = double.tryParse(_diningOutController.text) ?? 0.0;
    });
    // Show a confirmation snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Budgets saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Budget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Budgets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // TextFields for setting budgets
            TextField(
              controller: _groceriesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Groceries Budget'),
            ),
            TextField(
              controller: _utilitiesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Utilities Budget'),
            ),
            TextField(
              controller: _diningOutController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Dining Out Budget'),
            ),
            SizedBox(height: 20),
            // Button to save budgets
            ElevatedButton(
              onPressed: _saveBudget,
              child: Text('Save Budgets'),
            ),
          ],
        ),
      ),
    );
  }
}
