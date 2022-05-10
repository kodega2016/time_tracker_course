import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/home/jobs/job_entries_screen.dart';
import 'package:ptracker/src/home/jobs/job_form_screen.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:ptracker/src/widgets/job_list_tile.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return JobFormScreen(db: context.read<Database>());
          }));
        },
        child: const Icon(Feather.plus),
      ),
      body: StreamBuilder<List<Job>>(
        stream: context.read<Database>().jobsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _jobs = snapshot.data!;
            if (_jobs.isEmpty) {
              return const Center(
                child: Text('No jobs yet.'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _jobs.length,
              itemBuilder: (context, i) {
                final _job = _jobs[i];
                return JobListTile(
                  job: _job,
                  onDelete: (job) {
                    context.read<Database>().deleteJob(job.id);
                  },
                  onEdit: (job) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return JobFormScreen(
                          db: context.read<Database>(), job: job);
                    }));
                  },
                  onView: (job) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return JobEntriesScreen(
                          db: context.read<Database>(), job: job);
                    }));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
