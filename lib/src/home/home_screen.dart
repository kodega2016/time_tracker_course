import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ptracker/src/home/entries/entries_screen.dart';
import 'package:ptracker/src/home/jobs/jobs_screen.dart';
import 'package:ptracker/src/home/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreen = 0;
  final _pages = [
    const JobsScreen(),
    const EntriesScreen(),
    const ProfileScreen(),
  ];

  void _changeScreen(i) => setState(() {
        _currentScreen = i;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        onTap: _changeScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Feather.file_text),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.calendar),
            label: 'Entries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
