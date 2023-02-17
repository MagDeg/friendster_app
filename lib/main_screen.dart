import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friendster'), actions: [IconButton(onPressed: () => FirebaseAuth.instance.signOut(),icon: Icon(Icons.account_circle, size: 35))]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add, size: 30),
        backgroundColor: Colors.grey,

      ),
    );
  }
}
