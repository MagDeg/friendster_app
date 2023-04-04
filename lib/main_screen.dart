

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendster_app/chats/adding_new_chat_dialog.dart';
import 'package:friendster_app/design_samples/list_tile.dart';
import 'package:friendster_app/variables.dart';

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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("_userData").doc(idGlobal).collection('_chats').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var datas = FirebaseFirestore.instance.collection("_userData").doc(idGlobal).collection("_chats");



              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView(
                  children: snapshot.data!.docs.map((data) {

                    print(data['sender']);
                    print(data['senderID']);

                    return ListTileSample(data['senderID'], data['sender']);

                  }).toList(),
                );
              }
            }),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addChat(context);
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
      builder: (dialogContext) => AddChat());
}