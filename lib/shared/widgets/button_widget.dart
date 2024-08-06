import '../../export.dart';

class CommonButtonWidget extends StatelessWidget {
  final String title;
  final double padding;
  final double margin;
  final double radius;
  final double height;
  final double fontSize;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? fontColor;
  final Widget? icon;
  final double? width;
  final Border? border;
  final FontWeight? fontWeight;
  final bool isLoading;

  const CommonButtonWidget(
      {super.key,
      required this.title,
      this.padding = 0,
      this.margin = 0,
      this.radius = AppRadius.r8,
      this.height = Sizes.s40,
      this.fontSize = 14,
      this.onTap,
      this.style,
      this.isLoading = false,
      this.color,
      this.fontColor,
      this.icon,
      this.width,
      this.border,
      this.fontWeight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
            width: width ?? MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: margin),
            height: Responsive.isMobile(context) ? Sizes.s45 : height,
            decoration: BoxDecoration(
                color: color ?? Theme.of(context).primaryColor,
                border: border,
                borderRadius:
                    radius > 0 ? BorderRadius.circular(radius) : null),
            child: isLoading
                ? SizedBox(
                    width: Sizes.s25,
                    height: Sizes.s25,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        strokeAlign: 1,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (icon != null)
                      Row(children: [
                        icon ?? const HSpace(0),
                        const HSpace(10)
                      ]),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: style ??
                            AppCss.outfitMedium14.textColor(
                                Theme.of(context).colorScheme.onSurface))
                  ])));
  }
}
