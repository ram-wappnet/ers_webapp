import 'package:ers_admin/routes/app_route.dart';
import 'package:ers_admin/screens/login_screen/bloc/login_bloc.dart';

import 'package:ers_admin/screens/login_screen/widgets/login_left_desktop_view.dart';

import 'package:ers_admin/shared/widgets/custom_loading_widget.dart';
import '../../export.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Row(children: [
          if (Responsive.isDesktop(context)) const LoginLeftDesktopView(),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            const VSpace(Sizes.s70),
            Container(
                constraints:
                    const BoxConstraints(maxWidth: 550, maxHeight: 600),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Responsive.isMobile(context)
                          ? Colors.transparent
                          : Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(AppRadius.r10),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Insets.i30, vertical: Insets.i20),
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          context
                              .dismiss(); // Dismiss the loading dialog if there's a failure
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        } else if (state is LoginSuccess) {
                          context
                              .dismiss(); // Dismiss the loading dialog on success
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Successful')),
                          );

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            routeAdminScreen, // The route to navigate to
                            (route) => false, // Removes all routes
                          );
                        } else if (state is LoginLoading) {
                          context
                              .show(); // Show the loading dialog while loading
                        }
                      },
                      builder: (context, state) {
                        final bloc = context.read<LoginBloc>();
                        return LoginFormWidget(bloc: bloc);
                      },
                    ))),
            const VSpace(Sizes.s50),
          ]))),
        ]),
      ),
    );
  }
}
