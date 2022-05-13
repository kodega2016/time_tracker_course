import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';

class JobEntry {
  final Job job;
  final Entry entry;

  JobEntry({required this.job, required this.entry});
}
