import 'package:expenses_tracker/models/expense.dart';

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory({
    required this.category,
    required List<Expense> allExpenses,
  }) : expenses = allExpenses
           .where((expense) => expense.category == category)
           .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }

    return total;
  }
}
