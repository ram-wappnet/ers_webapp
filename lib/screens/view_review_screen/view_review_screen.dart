import 'package:ers_admin/shared/theme/app_css.dart';
import 'package:ers_admin/utils/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';

class ReviewDetailsScreen extends StatelessWidget {
  final String name;
  final int age;

  const ReviewDetailsScreen({required this.name, required this.age, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name: $name',
            style:
                AppCss.outfitBold18.textColor(Theme.of(context).primaryColor),
          ),
          Text('Age: $age',
              style: AppCss.outfitBold18
                  .textColor(Theme.of(context).primaryColor)),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Name: $name, Age: $age');
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
