import 'package:flutter/material.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:ptracker/src/widgets/job_entries_list_item.dart';

class JobEntriesScreen extends StatelessWidget {
  const JobEntriesScreen({
    Key? key,
    required this.db,
    required this.job,
  }) : super(key: key);

  final Database db;
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Entries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return const JobEntriesListItem();
          },
        ),
      ),
    );
  }
}
