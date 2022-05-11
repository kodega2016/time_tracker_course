import 'package:flutter/material.dart';
import 'package:ptracker/src/extensions/data_time_ext.dart';
import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/themes/app_colors.dart';

class JobEntriesListItem extends StatelessWidget {
  const JobEntriesListItem({
    Key? key,
    required this.entry,
    required this.job,
    required this.onClick,
    required this.onDelete,
  }) : super(key: key);

  final Entry entry;
  final Job job;
  final Function(Entry) onClick;
  final Function(Entry) onDelete;
  @override
  Widget build(BuildContext context) {
    final _pay = job.rate * entry.durationInHour;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Card(
        child: Dismissible(
          key: ValueKey(entry.id),
          direction: DismissDirection.endToStart,
          onDismissed: (dir) async {
            await onDelete(entry);
          },
          child: ListTile(
            isThreeLine: entry.comment == null ? false : true,
            onTap: () => onClick(entry),
            title: Text(
                '${entry.start.getDateString} - ${entry.end.getDateString}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rs ${job.rate} per hour [Rs.$_pay]'),
                if (entry.comment != null) Text('${entry.comment}'),
              ],
            ),
            trailing: Text(
              'Rs $_pay',
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseGrey,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
