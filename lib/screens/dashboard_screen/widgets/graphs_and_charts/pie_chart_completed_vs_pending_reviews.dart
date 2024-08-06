import 'package:ers_admin/export.dart';
import 'package:ers_admin/shared/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartCompletedVsPendingReviewsWidget extends StatelessWidget {
  const PieChartCompletedVsPendingReviewsWidget({super.key});

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
          Text("Completed Vs Pending Reviews",
              style: AppCss.outfitLight16
                  .textColor(Theme.of(context).colorScheme.onSecondary)),
          const VSpace(Sizes.s20),
          const Expanded(
            child: PieChartReviews(
              completedReviews: 60,
              pendingReviews: 60,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Theme.of(context).primaryColor,
                    size: 10,
                  ),
                  const HSpace(Sizes.s10),
                  Text('Completed',
                      style: AppCss.outfitLight16
                          .textColor(Theme.of(context).colorScheme.primary))
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: ErsAppColors.orangeColor,
                    size: 10,
                  ),
                  const HSpace(Sizes.s10),
                  Text('Pending',
                      style: AppCss.outfitLight16
                          .textColor(ErsAppColors.orangeColor))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PieChartReviews extends StatelessWidget {
  final int completedReviews;
  final int pendingReviews;

  const PieChartReviews({
    super.key,
    required this.completedReviews,
    required this.pendingReviews,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: showingSections(context),
        borderData: FlBorderData(show: false),
        sectionsSpace: 2,
        centerSpaceRadius: 60,
      ),
    );
  }

  List<PieChartSectionData> showingSections(BuildContext context) {
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: Theme.of(context).primaryColor,
              value: completedReviews.toDouble(),
              title: '$completedReviews',
              radius: 50,
              titleStyle: AppCss.outfitBold16
                  .textColor(Theme.of(context).colorScheme.onSecondary));
        case 1:
          return PieChartSectionData(
              color: Colors.orange,
              value: pendingReviews.toDouble(),
              title: '$pendingReviews',
              radius: 50,
              titleStyle: AppCss.outfitBold16
                  .textColor(Theme.of(context).colorScheme.onSecondary));
        default:
          throw Error();
      }
    });
  }
}
