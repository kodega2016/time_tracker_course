import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/extensions/data_time_ext.dart';
import 'package:ptracker/src/home/entries/daily_job_detail.dart';
import 'package:ptracker/src/home/entries/entries_bloc.dart';
import 'package:ptracker/src/widgets/entris_list_tile.dart';

class EntriesScreen extends StatelessWidget {
  const EntriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<DailyJobDetail>>(
          stream:
              Provider.of<EntriesBloc>(context, listen: false).entriesStream,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final _entries = snapshot.data!;
            final _totalPay =
                _entries.fold<double>(0, (sum, entry) => sum + entry.totalPay);
            final _totalDuration = _entries.fold<double>(
                0, (sum, entry) => sum + entry.totalDuration);

            return Column(
              children: [
                EntriesListTile(
                  title: 'All Entries',
                  subtitle: 'Rs.$_totalPay',
                  trailing: '$_totalDuration hrs',
                  jobs: const [],
                ),
                for (var entry in _entries)
                  EntriesListTile(
                    title: entry.date.getDateString,
                    subtitle: 'Rs.${entry.totalPay}',
                    trailing: '${entry.totalDuration} hrs',
                    jobs: entry.jobs,
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
