import '../../export.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Employee',
        style: AppCss.outfitMedium20
            .textColor(Theme.of(context).colorScheme.onSecondary));
  }
}
