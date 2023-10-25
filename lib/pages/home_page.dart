import 'package:flutter/material.dart';
import 'package:my_first_app/data/expense_data.dart';
import 'package:my_first_app/models/expense_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Text Controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //Add new Expense
  void addNewExpense(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add new Expense'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //expense name
                  TextField(
                    controller: newExpenseNameController,
                  ),

                  //expense amount
                  TextField(
                    controller: newExpenseAmountController,
                  ),
                ],
              ),
              actions: [
                //Save button
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),
                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: Text('Cancel'),
                )
              ],
            ));
  }

  //Save
  void save() {
    //Create expense item
    ExpenseItem newExpense =
        ExpenseItem(
          name: newExpenseNameController.text,
          amount: newExpenseAmountController.text, 
          dateTime: DateTime.now()
          );
    // Add the new Expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
  }

  //Cancel
  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewExpense(context); // Call the function with the context.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
