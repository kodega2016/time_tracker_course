import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/services/auth.dart';
import 'package:ptracker/src/themes/app_themes.dart';
import 'package:ptracker/src/widgets/p_elevated_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Theme(
              data: AppThemes.googleTheme,
              child: PElevatedButton(
                label: 'Sign in with Google',
                onPressed: () async {
                  try {
                    await context.read<BaseAuth>().signInWithGoogle();
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Theme(
              data: AppThemes.facebookTheme,
              child: PElevatedButton(
                label: 'Sign in with Facebook',
                onPressed: () async {
                  try {
                    await context.read<BaseAuth>().signInWithFacebook();
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Theme(
              data: Theme.of(context).copyWith(
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      ),
                ),
              ),
              child: PElevatedButton(
                label: 'Sign in Anonymously',
                onPressed: () async {
                  try {
                    await context.read<BaseAuth>().signInAnonymously();
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
