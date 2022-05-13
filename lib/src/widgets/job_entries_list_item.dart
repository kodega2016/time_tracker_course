import 'package:flutter/material.dart';
import 'package:ptracker/src/extensions/data_time_ext.dart';
import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';

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
          background: Container(color: Colors.red),
          direction: DismissDirection.endToStart,
          onDismissed: (dir) async {
            await onDelete(entry);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              onTap: () => onClick(entry),
              title: Text(
                  '${entry.start.getDateString} - ${entry.end.getDateStringMonth}'),
              subtitle: Text('${entry.comment}'),
              trailing: Text('[Rs.$_pay]'),
            ),
          ),
        ),
      ),
    );
  }
}
