import 'package:ers_admin/export.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.title, required this.tapEvent});

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      borderRadius: BorderRadius.circular(AppRadius.r10),
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title,
            style:
                AppCss.outfitBold16.textColor(Theme.of(context).primaryColor)),
      ),
    );
  }
}
