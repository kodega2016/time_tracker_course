import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:ptracker/src/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<User>(builder: (context, user, _) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: user.photoURL == null
                    ? const Icon(Feather.camera, size: 15)
                    : null,
                backgroundImage:
                    user.photoURL != null ? NetworkImage(user.photoURL!) : null,
              ),
              title: Text(user.displayName ?? 'Anonymous User'),
              subtitle: Text(
                user.email ?? user.uid,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Attention'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () async {
                                await Provider.of<BaseAuth>(context,
                                        listen: false)
                                    .signOut();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Feather.log_out),
              ),
            ),
          );
        }),
      ),
    );
  }
}
