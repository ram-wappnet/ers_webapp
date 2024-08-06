import 'package:ers_admin/routes/app_route.dart';

import '../screens/admin_dashboard_index/admin_dashboard_index.dart';
import '../screens/landing_screen/landing_screen.dart';
import '../screens/login_screen/login_screen.dart';

final routes = {
  // routeSplashScreen: (context) => const SplashScreen(),
  routeLoginScreen: (context) => const LoginScreen(),
  routeLandingScreen: (context) => LandingScreen(),
  routeAdminScreen: (context) => const AdminDashboard(),
};
