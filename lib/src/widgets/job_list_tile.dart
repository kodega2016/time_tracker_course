import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ptracker/src/models/job/job.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({
    Key? key,
    required this.job,
    required this.onDelete,
    required this.onEdit,
    required this.onView,
  }) : super(key: key);

  final Job job;
  final Function(Job) onDelete;
  final Function(Job) onEdit;
  final Function(Job) onView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Card(
        child: Dismissible(
          key: ValueKey(job.id),
          direction: DismissDirection.endToStart,
          onDismissed: (dir) async {
            onDelete(job);
          },
          child: ListTile(
            title: Text(job.title),
            subtitle: Text('Rs.${job.rate}'),
            onTap: () => onView(job),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 10,
            ),
            trailing: IconButton(
              onPressed: () async {
                onEdit(job);
              },
              icon: const Icon(Feather.edit),
            ),
          ),
        ),
      ),
    );
  }
}
