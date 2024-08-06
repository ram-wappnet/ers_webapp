import 'package:fl_chart/fl_chart.dart';

import '../../../../export.dart';

class BarChartEmployeeAveragePerformance extends StatelessWidget {
  const BarChartEmployeeAveragePerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
            border: Border.all(
                width: 0, color: Theme.of(context).colorScheme.onSecondary)),
        groupsSpace: 0,
        gridData: const FlGridData(
          drawVerticalLine: true,
          horizontalInterval: 1,
        ),
        barTouchData:
            BarTouchData(enabled: false, allowTouchBarBackDraw: false),
        titlesData: FlTitlesData(
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          show: true,
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              "Quaterely Report",
              style: AppCss.outfitLight14
                  .textColor(Theme.of(context).colorScheme.onSecondary),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 1:
                    return Text(
                      'Q1',
                      style: AppCss.outfitLight14
                          .textColor(Theme.of(context).colorScheme.onSecondary),
                    );
                  case 2:
                    return Text(
                      'Q2',
                      style: AppCss.outfitLight14
                          .textColor(Theme.of(context).colorScheme.onSecondary),
                    );
                  case 3:
                    return Text(
                      'Q3',
                      style: AppCss.outfitLight14
                          .textColor(Theme.of(context).colorScheme.onSecondary),
                    );
                  case 4:
                    return Text(
                      'Q4',
                      style: AppCss.outfitLight14
                          .textColor(Theme.of(context).colorScheme.onSecondary),
                    );
                  default:
                    return const Text('');
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: AppCss.outfitLight14
                      .textColor(Theme.of(context).colorScheme.onSecondary),
                );
              },
              interval: 1, // Adjust this interval based on your data range
            ),
          ),
        ),
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 2,
                width: 20,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 3,
                width: 20,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 4,
                width: 20,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 5,
                width: 20,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
