import 'package:ptracker/src/home/entries/job_detail.dart';

class DailyJobDetail {
  final DateTime date;
  final List<JobDetail> jobs;

  DailyJobDetail({
    required this.date,
    required this.jobs,
  });

  double get totalPay => jobs.fold(0, (total, job) => total + job.pay);

  double get totalDuration {
    return jobs.fold(0, (total, job) => total + job.duration);
  }
}
