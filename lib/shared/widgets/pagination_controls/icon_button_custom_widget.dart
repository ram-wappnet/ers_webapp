import '../../../export.dart';
import '../../theme/app_colors.dart';

class IconButtonCustomWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  const IconButtonCustomWidget(
      {super.key, required this.icon, this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(Insets.i4),
      decoration: BoxDecoration(
        border: Border.all(
            color: onPressed != null
                ? Theme.of(context).primaryColor
                : ErsAppColors.darkGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
          onTap: onPressed,
          child: Icon(icon,
              color: onPressed != null
                  ? Theme.of(context).primaryColor
                  : ErsAppColors.darkGray)),
    );
  }
}
