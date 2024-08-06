import 'package:ers_admin/screens/landing_screen/widgets/footer.dart';
import 'package:ers_admin/screens/landing_screen/widgets/header.dart';
import 'package:ers_admin/screens/landing_screen/widgets/side_menu.dart';

import '../../export.dart';
import 'widgets/jumbotron.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final formKey = GlobalKey<FormState>(debugLabel: "Key1");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            constraints:
                BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Header(), Jumbotron(), NavigationFooter()],
            ),
          ),
        ),
      ),
    );
  }
}
