import '../../../export.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isCircular;

  const CustomNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 40;
    const double size = 80;

    return isCircular
        ? CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[200],
            child: _buildImage(context, radius: radius),
          )
        : Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildImage(context),
          );
  }

  Widget _buildImage(BuildContext context, {double? radius}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: isCircular ? null : BorderRadius.circular(8),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: isCircular
            ? CircleAvatar(
                backgroundColor:
                    Theme.of(context).primaryColorLight.withOpacity(0.1),
                radius: radius,
              )
            : Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
      ),
      errorWidget: (context, url, error) => isCircular
          ? CircleAvatar(
              backgroundColor:
                  Theme.of(context).primaryColorLight.withOpacity(0.1),
              radius: radius,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '-',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          : Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight.withOpacity(0.1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '-',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
    );
  }
}
