import 'package:flutter/material.dart';
import 'package:ptracker/src/themes/app_colors.dart';

class JobEntriesListItem extends StatelessWidget {
  const JobEntriesListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Card(
        child: ListTile(
          title: const Text('2019-01-01'),
          subtitle: const Text('Rs 100 per hour [Rs.12000]'),
          trailing: Text(
            'Rs .1200',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.baseGrey,
                ),
          ),
        ),
      ),
    );
  }
}
