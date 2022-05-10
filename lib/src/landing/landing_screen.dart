import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/home/home_screen.dart';
import 'package:ptracker/src/services/auth.dart';
import 'package:ptracker/src/services/database.dart';
import 'package:ptracker/src/sign_in/sign_in_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<BaseAuth>().userChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _user = snapshot.data;
            return Provider<User>.value(
              value: _user!,
              child: Provider<Database>(
                create: (_) => FirestoreDatabase(uid: _user.uid),
                child: const HomeScreen(),
              ),
            );
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
