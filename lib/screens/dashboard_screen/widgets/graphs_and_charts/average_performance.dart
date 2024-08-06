import 'package:ers_admin/export.dart';

import 'bar_chart_employee_average_performance.dart';

class AveragePerformanceWidget extends StatelessWidget {
  const AveragePerformanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s350,
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.i16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Average Performance",
              style: AppCss.outfitLight16
                  .textColor(Theme.of(context).colorScheme.onSecondary)),
          const VSpace(Sizes.s20),
          const Expanded(
            child: BarChartEmployeeAveragePerformance(),
          )
        ],
      ),
    );
  }
}
