import 'package:flutter/material.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
    );
  }
}
