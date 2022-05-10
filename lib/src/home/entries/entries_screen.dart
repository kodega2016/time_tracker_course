import 'package:flutter/material.dart';
import 'package:ptracker/src/themes/app_colors.dart';

class EntriesScreen extends StatelessWidget {
  const EntriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, i) {
            return const EntriesListTile();
          },
        ),
      ),
    );
  }
}

class EntriesListTile extends StatelessWidget {
  const EntriesListTile({
    Key? key,
  }) : super(key: key);

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
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Expanded(child: Text('2021-01-01')),
                    Expanded(child: Text('2021-01-01')),
                    Expanded(child: Text('2021-01-01')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text('Mobile Application Developer'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('10 hrs'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Rs.1200'),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text('Mobile Application Developer'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('10 hrs'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Rs.1200'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
