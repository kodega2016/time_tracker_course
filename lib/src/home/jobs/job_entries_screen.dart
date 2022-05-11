import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ptracker/src/models/entry/entry.dart';
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Feather.plus),
        onPressed: () {
          Navigator.pushNamed(context, '/job_entries_form', arguments: {
            'db': db,
            'job': job,
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<Entry>>(
            stream: db.entriesStream(jobId: job.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final _entries = snapshot.data!;
                return ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, i) {
                    final _entry = _entries[i];
                    return JobEntriesListItem(
                      job: job,
                      entry: _entry,
                      onClick: (entry) {
                        Navigator.pushNamed(
                          context,
                          '/job_entries_form',
                          arguments: {
                            'db': db,
                            'job': job,
                            'entry': entry,
                          },
                        );
                      },
                      onDelete: (entry) async {
                        await db.deleteEntry(entry.id);
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
