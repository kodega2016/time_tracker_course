import 'package:flutter/material.dart';
import 'package:ptracker/src/home/jobs/job_entries_form.dart';
import 'package:ptracker/src/home/jobs/job_form_screen.dart';

import 'home/jobs/job_entries_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String jobForm = '/job_form';
  static const String jobEntries = '/job_entries';
  static const String jobEntriesForm = '/job_entries_form';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case jobForm:
        return MaterialPageRoute(builder: (_) {
          return JobFormScreen(
            db: (settings.arguments as Map<String, dynamic>)['db'],
            job: (settings.arguments as Map<String, dynamic>)['job'],
          );
        });
      case jobEntries:
        return MaterialPageRoute(builder: (_) {
          return JobEntriesScreen(
            db: (settings.arguments as Map<String, dynamic>)['db'],
            job: (settings.arguments as Map<String, dynamic>)['job'],
          );
        });
      case jobEntriesForm:
        return MaterialPageRoute(builder: (_) {
          return JobEntriesForm(
            db: (settings.arguments as Map<String, dynamic>)['db'],
            job: (settings.arguments as Map<String, dynamic>)['job'],
            entry: (settings.arguments as Map<String, dynamic>)['entry'],
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Not Found'),
            ),
          );
        });
    }
  }
}
