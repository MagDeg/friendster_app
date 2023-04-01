import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendster_app/chats/adding_new_chat_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Friendster', style: TextStyle(color: Colors.purple),),
            backgroundColor: Colors.black54,
            actions: [
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    },
                  icon: Icon(Icons.account_circle, size: 35, color: Colors.white,))]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.add, size: 30, color: Colors.white),
          backgroundColor: Colors.black54,

        ),
      ),
    );
  }
}

void addChat(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AddChat());
}