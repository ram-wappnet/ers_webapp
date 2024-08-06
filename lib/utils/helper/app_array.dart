import 'package:ers_admin/shared/theme/app_colors.dart';

import '../../export.dart';
import '../../screens/admin_dashboard_index/cubit/admin_tab_state.dart';

class AppArray {
  //Drawer list
  var drawerList = [
    {
      'title': "Dashboard",
      "darkIcon": AssetConstants.icDashboard,
      "tab": NavigationTab.dashboard,
    },
    {
      'title': "Feedback",
      "darkIcon": AssetConstants.icFeedback,
      "tab": NavigationTab.feedback,
    },
    {
      'title': "Employee",
      "darkIcon": AssetConstants.icEmployee,
      "tab": NavigationTab.employee,
    },
    {
      'title': "Review",
      "darkIcon": AssetConstants.icReview,
      "tab": NavigationTab.review,
    },
    /*  {
      'title': "logout",
      "darkIcon": AssetConstants.notificationDark,
      "tab": NavigationTab.dashboard,
    }, */
  ];

  final recentFormsSubmitted = [
    ListTaskAssignedData(
      icon:
          const Icon(Icons.person_2_outlined, color: ErsAppColors.orangeColor),
      label: "Ram Ghumaliya",
      jobDesk: "Flutter Developer",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon:
          const Icon(Icons.person_2_outlined, color: ErsAppColors.orangeColor),
      label: "Ayan Multani",
      jobDesk: "React Native Developer",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
    ListTaskAssignedData(
      icon:
          const Icon(Icons.person_2_outlined, color: ErsAppColors.orangeColor),
      label: "Aditya Panda",
      jobDesk: "Flutter Developer",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
    ListTaskAssignedData(
      icon:
          const Icon(Icons.person_2_outlined, color: ErsAppColors.orangeColor),
      label: "Justin Beck",
      jobDesk: "React Native Developer",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
  ];
}

class ListTaskAssignedData {
  final Icon icon;
  final String label;
  final String jobDesk;
  final DateTime? editDate;
  final String? assignTo;

  const ListTaskAssignedData({
    required this.icon,
    required this.label,
    required this.jobDesk,
    this.editDate,
    this.assignTo,
  });
}
