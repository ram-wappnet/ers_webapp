// ignore_for_file: use_build_context_synchronously

import '../../export.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text('Review Screen Content')),
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context,
              '/review/details',
              arguments: {'name': 'John Doe', 'age': 30},
            );
            if (result != null) {
              printErsLog('Returned from Review Details: $result');
            }
          },
          child: const Text('Go to Review Details'),
        ),
      ],
    );
  }
}

/* 
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = ['1', '2', '3']; // List of review IDs
    return Column(
      children: [
        Text('Review',
            style: AppCss.outfitMedium20
                .textColor(Theme.of(context).colorScheme.onSecondary)),
        // Sample data

        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final id = reviews[index];
              return ListTile(
                title: Text('Review $id',
                    style: AppCss.outfitMedium20
                        .textColor(Theme.of(context).colorScheme.onSecondary)),
                trailing: ElevatedButton(
                  onPressed: () {
                    // GoRouter.of(context).push('/review/view/');
                    // GoRouter.of(context).go('/review/details');
                    context
                        .go('/review/details/123'); // Pass dynamic ID as needed
                  },
                  child: Text('View',
                      style: AppCss.outfitMedium20.textColor(
                          Theme.of(context).colorScheme.onSecondary)),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
 */