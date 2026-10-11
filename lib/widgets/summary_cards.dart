import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('Income', provider.totalIncome, Colors.green.shade800, Colors.white),
            _buildCard('Expense', provider.totalExpense, Colors.red.shade700, Colors.white),
            _buildCard('Balance', provider.netBalance, Colors.brown.shade900, Colors.amber.shade300),
          ],
        );
      },
    );
  }

  Widget _buildCard(String title, double amount, Color textColor, Color bgColor) {
    return Expanded(
      child: Card(
        color: bgColor,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            children: [
              Text(
                title, 
                style: TextStyle(fontWeight: FontWeight.w600, color: textColor.withOpacity(0.8), fontSize: 13)
              ),
              const SizedBox(height: 8),
              Text(
                '\$${amount.toStringAsFixed(0)}', 
                style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
