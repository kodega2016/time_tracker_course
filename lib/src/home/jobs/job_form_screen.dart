import 'package:flutter/material.dart';
import 'package:ptracker/src/extensions/data_time_ext.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:ptracker/src/widgets/p_elevated_button.dart';

class JobFormScreen extends StatefulWidget {
  const JobFormScreen({
    Key? key,
    required this.db,
    this.job,
  }) : super(key: key);

  final Database db;
  final Job? job;

  @override
  State<JobFormScreen> createState() => _JobFormScreenState();
}

class _JobFormScreenState extends State<JobFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  double? _rate;

  @override
  void initState() {
    _title = widget.job?.title;
    _rate = widget.job?.rate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    initialValue: _title,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _title = value,
                    validator: (value) => (value?.isEmpty ?? true)
                        ? 'Please enter a job title'
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Job Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: _rate?.toString(),
                    textInputAction: TextInputAction.done,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    onChanged: (value) => _rate = double.tryParse(value),
                    validator: (value) => (value?.isEmpty ?? true)
                        ? 'Please enter a job rate'
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Rate per hour',
                    ),
                  ),
                  const SizedBox(height: 10),
                  PElevatedButton(
                    label: widget.job == null ? 'Save' : 'Update',
                    onPressed: () async => await _save(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _save() {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save();
        final _job = Job(
          id: widget.job?.id ?? DateTime.now().getUniqueId,
          title: _title!,
          rate: _rate!,
        );

        widget.db.createOrUpdateJob(_job);
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }
}
