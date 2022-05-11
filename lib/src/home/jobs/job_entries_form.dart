import 'package:flutter/material.dart';
import 'package:ptracker/src/extensions/data_time_ext.dart';
import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:ptracker/src/widgets/p_elevated_button.dart';

class JobEntriesForm extends StatefulWidget {
  const JobEntriesForm({
    Key? key,
    required this.db,
    required this.job,
    this.entry,
  }) : super(key: key);

  final Database db;
  final Job job;
  final Entry? entry;

  @override
  State<JobEntriesForm> createState() => _JobEntriesFormState();
}

class _JobEntriesFormState extends State<JobEntriesForm> {
  late DateTime _startDate;
  late DateTime _endDate;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  String? _comments;
  bool _isLoading = false;

  @override
  void initState() {
    final _start = widget.entry?.start ?? DateTime.now();
    final _end = widget.entry?.end ?? _start.add(const Duration(days: 1));

    _startDate = DateTime(_start.year, _start.month, _start.day);
    _endDate = DateTime(_end.year, _end.month, _end.day);

    _startTime = TimeOfDay.fromDateTime(_start);
    _endTime = TimeOfDay.fromDateTime(_end);

    _comments = widget.entry?.comment;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: widget.job.title,
                  enabled: false,
                ),
                const SizedBox(height: 10),
                DateTimePicker(
                  date: _startDate,
                  time: _startTime,
                  onDateChanged: (date) {
                    setState(() {
                      _startDate = date;
                    });
                  },
                  onTimeChanged: (time) {
                    setState(() {
                      _startTime = time;
                    });
                  },
                ),
                const SizedBox(height: 10),
                DateTimePicker(
                  date: _endDate,
                  time: _endTime,
                  onDateChanged: (date) {
                    setState(() {
                      _endDate = date;
                    });
                  },
                  onTimeChanged: (time) {
                    setState(() {
                      _endTime = time;
                    });
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _comments,
                  onChanged: (val) {
                    setState(() {
                      _comments = val;
                    });
                  },
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Comments'),
                  maxLength: 100,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: PElevatedButton(
                    isLoading: _isLoading,
                    label: widget.entry == null ? 'Save' : 'Update',
                    onPressed: () async => await _save(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final _start = DateTime(
        _startDate.year,
        _startDate.month,
        _startDate.day,
        _startTime.hour,
        _startTime.minute,
      );

      final _end = DateTime(
        _endDate.year,
        _endDate.month,
        _endDate.day,
        _endTime.hour,
        _endTime.minute,
      );

      final _entry = Entry(
        id: widget.entry?.id ?? DateTime.now().getUniqueId,
        jobId: widget.job.id,
        start: _start,
        end: _end,
        comment: _comments,
      );
      await widget.db.createOrUpdateEntry(_entry);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    Key? key,
    required this.date,
    required this.time,
    required this.onDateChanged,
    required this.onTimeChanged,
  }) : super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final _date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                initialDate: date,
              );
              if (_date != null) {
                onDateChanged(_date);
              }
            },
            child: InputDecorator(
              child: Text(date.getDateString),
              decoration: const InputDecoration(
                labelText: 'Start',
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final _time = await showTimePicker(
                context: context,
                initialTime: time,
              );
              if (_time != null) {
                onTimeChanged(_time);
              }
            },
            child: InputDecorator(
              child: Text(time.format(context)),
              decoration: const InputDecoration(),
            ),
          ),
        )
      ],
    );
  }
}
