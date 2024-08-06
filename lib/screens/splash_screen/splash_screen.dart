import 'package:ers_admin/export.dart';
import 'package:ers_admin/routes/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //Create SplashBloc and call Loadsplash Event
      create: (context) => SplashBloc()..add(LoadSplash()),
      child: Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              // context.
              Navigator.pushReplacementNamed(context, routeLoginScreen);
            }
          },
          child: Center(
            child: Text(LocaleKeys.employeeFeedbackSystem.tr()),
          ),
        ),
      ),
    );
  }
}
