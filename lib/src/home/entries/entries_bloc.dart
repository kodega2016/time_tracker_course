import 'package:ptracker/src/home/entries/job_detail.dart';
import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/models/jobEntry.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:rxdart/rxdart.dart';

import 'daily_job_detail.dart';

class EntriesBloc {
  final Database db;
  EntriesBloc({required this.db});

  Stream<List<DailyJobDetail>> get entriesStream {
    return Rx.combineLatest2(db.jobsStream(), db.entriesStream(), _combiner)
        .map(_createModels);
  }

  List<JobEntry> _combiner(List<Job> jobs, List<Entry> entries) {
    return entries.map((e) {
      final job = jobs.firstWhere((j) => j.id == e.jobId);
      return JobEntry(job: job, entry: e);
    }).toList();
  }

  List<DailyJobDetail> _createModels(List<JobEntry> entries) {
    final _groupedData = _groupByDate(entries);

    List<DailyJobDetail> _dailyJobDetails = [];

    for (var item in _groupedData.keys) {
      _dailyJobDetails.add(
        DailyJobDetail(date: item, jobs: _getJobs(_groupedData[item])),
      );
    }

    return _dailyJobDetails;
  }

  List<JobDetail> _getJobs(List<JobEntry> entries) {
    Map<String, JobDetail> _jobs = {};

    for (var item in entries) {
      final _entry = item.entry;
      final _job = item.job;

      final _pay = _job.rate * _entry.durationInHour;

      if (!_jobs.containsKey(_entry.jobId)) {
        _jobs[_entry.jobId] = JobDetail(
          duration: _entry.durationInHour,
          name: _job.title,
          pay: _pay,
        );
      } else {
        _jobs[_entry.jobId]?.duration += _entry.durationInHour;
        _jobs[_entry.jobId]?.pay += _pay;
      }
    }

    return _jobs.values.toList();
  }

  _groupByDate(List<JobEntry> entries) {
    Map<DateTime, List<JobEntry>> _groupedEntries = {};

    for (var item in entries) {
      final _date = DateTime(
        item.entry.start.year,
        item.entry.start.month,
        item.entry.start.day,
      );

      if (_groupedEntries.containsKey(_date)) {
        _groupedEntries[_date]!.add(item);
      } else {
        _groupedEntries[_date] = [item];
      }
    }

    return _groupedEntries;
  }
}


//Group stream of jobs and entries
//Group job-entries stream by date
//Get the job details for the job