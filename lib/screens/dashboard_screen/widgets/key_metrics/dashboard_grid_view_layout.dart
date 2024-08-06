import 'package:ers_admin/screens/admin_dashboard_index/cubit/admin_tab_cubit.dart';
import 'package:ers_admin/screens/admin_dashboard_index/cubit/admin_tab_state.dart';
import 'package:ers_admin/screens/dashboard_screen/widgets/key_metrics/dashboard_box_layout.dart';

import '../../../../export.dart';
import '../../bloc/dashboard_screen_bloc.dart';

class DashboardGridViewLayout extends StatelessWidget {
  const DashboardGridViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: Responsive.isMobile(context)
                    ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 100,
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
                  return DashboardBoxLayout(
                    count: 15,
                    title: listDashboardCardItemSingle['title'],
                  ).inkWell(context, onTap: () {});
                }));
      },
    );
  }
}
