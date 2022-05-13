import 'package:flutter/material.dart';
import 'package:ptracker/src/home/entries/job_detail.dart';
import 'package:ptracker/src/themes/app_colors.dart';

class EntriesListTile extends StatelessWidget {
  const EntriesListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.jobs,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String trailing;
  final List<JobDetail> jobs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.baseGrey.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(title),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text(subtitle),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text(trailing),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            ...jobs.map((e) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(e.name),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Rs.${e.pay}'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('${e.duration} hrs'),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
