// lib/screens/expense_log_screen.dart

import 'package:flutter/material.dart';
import 'package:expense_explorer/models/expense.dart';
import 'package:expense_explorer/screens/insights_screen.dart'; // Import InsightsScreen
import 'package:expense_explorer/screens/budget_screen.dart'; // Import BudgetScreen

class ExpenseLogScreen extends StatefulWidget {
  @override
  _ExpenseLogScreenState createState() => _ExpenseLogScreenState();
}

class _ExpenseLogScreenState extends State<ExpenseLogScreen> {
  String _selectedCategory = 'Uncategorized';
  TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<Expense> expenses = [];
    bool _isSubmitButtonEnabled() {
    // Check if the amount field is not empty
    return _amountController.text.isNotEmpty;
  }

  void _submitExpense() {
    if (_isSubmitButtonEnabled()) {
      double amount = double.tryParse(_amountController.text) ?? 0.0;
      Expense newExpense = Expense(
        amount: amount,
        category: _selectedCategory,
        date: _selectedDate,
      );
      setState(() {
        expenses.add(newExpense);
      });}


    // Clear the form after submission
    _amountController.clear();
    setState(() {
      _selectedCategory = 'Uncategorized';
      _selectedDate = DateTime.now();
    });
  }

  void _deleteExpense(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              items: <String>[
                'Uncategorized',
                'Groceries',
                'Utilities',
                'Dining Out',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Date: ${_selectedDate.toLocal()}'),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitExpense,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  Expense expense = expenses[index];
                  return Dismissible(
                    key: Key(expense.toString()), // Unique key for each expense
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _deleteExpense(index);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text('Amount: ${expense.amount.toString()}'),
                      subtitle: Text('Category: ${expense.category}'),
                      trailing: Text('Date: ${expense.date.toString()}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Insights screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsightsScreen(expenses: expenses)),
                );
              },
              child: Text('View Insights'),
            ),
            // Button to navigate to Budget screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BudgetScreen()),
                );
              },
              child: Text('Manage Budget'),
            ),
          ],
        ),
      ),
    );
  }
}
