import 'package:lottie/lottie.dart';

import '../../../export.dart';

class LoginLeftDesktopView extends StatelessWidget {
  const LoginLeftDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.sizeOf(context).width / 2,
      child: Lottie.asset(
        AssetConstants.loginScreenAnimation,
        fit: BoxFit.contain,
      ),
    );
  }
}
