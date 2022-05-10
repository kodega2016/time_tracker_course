import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/landing/landing_screen.dart';
import 'package:ptracker/src/services/auth.dart';
import 'package:ptracker/src/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TimeTracker());
}

class TimeTracker extends StatelessWidget {
  const TimeTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<BaseAuth>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.primaryTheme,
        home: const LandingScreen(),
      ),
    );
  }
}
