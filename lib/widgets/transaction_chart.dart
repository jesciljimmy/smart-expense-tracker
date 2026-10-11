import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class TransactionChart extends StatelessWidget {
  const TransactionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, child) {
        final breakdown = provider.expenseCategoryBreakdown;
        if (breakdown.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No expenses to show in chart',
                style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.w500),
              ),
            ),
          );
        }

        List<PieChartSectionData> sections = [];
        int i = 0;
        final colors = [
          Colors.amber.shade400,
          Colors.green.shade400,
          Colors.green.shade700,
          Colors.amber.shade700,
          Colors.lightGreen.shade400,
          Colors.yellow.shade600
        ];
        
        breakdown.forEach((category, amount) {
          sections.add(
            PieChartSectionData(
              color: colors[i % colors.length],
              value: amount,
              title: category,
              radius: 50,
              titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            )
          );
          i++;
        });

        return SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: sections,
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        );
      },
    );
  }
}
