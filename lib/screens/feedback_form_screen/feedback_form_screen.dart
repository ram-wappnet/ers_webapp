import '../../export.dart';
import '../dashboard_screen/bloc/dashboard_screen_bloc.dart';

import '../dashboard_screen/widgets/key_metrics/dashboard_box_layout.dart';

class FeedbackFormScreen extends StatelessWidget {
  const FeedbackFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text('Feedback Form',
            style: AppCss.outfitMedium20
                .textColor(Theme.of(context).colorScheme.onSecondary)),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: Responsive.isMobile(context)
                    ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 150,
                      )
                    : MediaQuery.of(context).size.width < 1500
                        ? const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 120,
                          )
                        : const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 120,
                          ),
                itemCount: context
                    .read<DashboardScreenBloc>()
                    .listDashboardCardItem
                    .length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final Map<String, dynamic> listDashboardCardItemSingle =
                      context
                          .read<DashboardScreenBloc>()
                          .listDashboardCardItem[index];

                  return Row(
                    children: [
                      /*    Text(
                            context.read<AdminCubit>().pageName,
                            style: AppCss.outfitMedium14.textColor(
                                Theme.of(context).colorScheme.onSecondary),
                          ), */
                      Expanded(
                        child: DashboardBoxLayout(
                          count: 100000,
                          title: listDashboardCardItemSingle['title'],
                        ).inkWell(context, onTap: () {}),
                      ),
                    ],
                  );
                })),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final isDarkMode = state.themeMode == ThemeModeState.dark;
            printErsLog(isDarkMode.toString());
            return Switch(
              value: isDarkMode,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
            );
          },
        ),
        /*   SizedBox(
          // height: 700,
          child: PaginationWidget<Map<String, dynamic>>(
            apiUrl: 'https://jsonplaceholder.typicode.com/posts',
            fromJson: (json) => json,
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Title')),
            ],
            rows: (items) {
              return items.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(Text(item['title'])),
                  ],
                );
              }).toList();
            },
            queryParameters: {},
          ),
        ), */
        Container(
            color: Colors.pink,
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Text(
                  'Item $index',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                );
              },
            )),
      ],
    ));
  }
}
