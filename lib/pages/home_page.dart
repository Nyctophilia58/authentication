import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
            'LOGGED IN AS: ${user!.email}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
    );
  }
}