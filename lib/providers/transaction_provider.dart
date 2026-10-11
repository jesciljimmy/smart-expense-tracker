import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions {
    // Sort by most recent
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    return [..._transactions];
  }

  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void updateTransaction(TransactionModel transaction) {
    final index = _transactions.indexWhere((t) => t.id == transaction.id);
    if (index >= 0) {
      _transactions[index] = transaction;
      notifyListeners();
    }
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  double get totalIncome => _transactions
      .where((t) => t.type == TransactionType.income)
      .fold(0.0, (sum, item) => sum + item.amount);

  double get totalExpense => _transactions
      .where((t) => t.type == TransactionType.expense)
      .fold(0.0, (sum, item) => sum + item.amount);

  double get netBalance => totalIncome - totalExpense;

  Map<String, double> get expenseCategoryBreakdown {
    final breakdown = <String, double>{};
    for (var t in _transactions) {
      if (t.type == TransactionType.expense) {
        breakdown[t.category] = (breakdown[t.category] ?? 0.0) + t.amount;
      }
    }
    return breakdown;
  }
}
