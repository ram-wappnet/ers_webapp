import 'package:ers_admin/export.dart';

part 'dashboard_screen_event.dart';
part 'dashboard_screen_state.dart';

class DashboardScreenBloc
    extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  final List<Map<String, dynamic>> listDashboardCardItem = [
    {'title': "Total Employees", 'icon': AssetConstants.assetAppLogo},
    {'title': 'Completed Reviews', 'icon': AssetConstants.assetAppLogo},
    {'title': 'Pending Reviews', 'icon': AssetConstants.assetAppLogo},
    {'title': 'Average Rating', 'icon': AssetConstants.assetAppLogo},
  ];
  DashboardScreenBloc() : super(DashboardScreenInitial()) {
    on<DashboardScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
