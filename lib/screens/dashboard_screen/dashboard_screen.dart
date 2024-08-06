import '../../export.dart';

import 'widgets/graphs_and_charts/average_performance.dart';
import 'widgets/graphs_and_charts/pie_chart_completed_vs_pending_reviews.dart';
import 'widgets/key_metrics/dashboard_grid_view_layout.dart';

import 'widgets/low_performers/low_performers.dart';
import 'widgets/recent_activities/recent_activities.dart';
import 'widgets/top_performers/top_performers.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeMode == ThemeModeState.dark;

        return Column(
          children: [
            //COUNT WIDGET
            const DashboardGridViewLayout(),
            const VSpace(Sizes.s20),
            //Bar chart and Pie Chart
            if (!Responsive.isMobile(context))
              const Row(
                children: [
                  Expanded(flex: 1, child: AveragePerformanceWidget()),
                  HSpace(Sizes.s20),
                  Expanded(
                      flex: 1,
                      child: PieChartCompletedVsPendingReviewsWidget()),
                ],
              ),
            if (Responsive.isMobile(context)) ...[
              const AveragePerformanceWidget(),
              const VSpace(Sizes.s20),
              const PieChartCompletedVsPendingReviewsWidget()
            ],
            const VSpace(Sizes.s20), const RecentActivitiesWidget(),
            const VSpace(Sizes.s20),
            //PerformanceWidget
            if (!Responsive.isMobile(context))
              const Row(
                children: [
                  Expanded(flex: 1, child: TopPerformersWidget()),
                  HSpace(Sizes.s20),
                  Expanded(flex: 1, child: LowPerformersWidget()),
                ],
              ),
            if (Responsive.isMobile(context)) ...[
              const VSpace(Sizes.s20),
              const TopPerformersWidget(),
              const VSpace(Sizes.s20),
              const LowPerformersWidget(),
            ],

            Switch(
              value: isDarkMode,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
            ),
            // RecentUsers(),
            const VSpace(Sizes.s20),
          ],
        );
      },
    );
  }
}
