import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendster_app/variables.dart';

class ChatHistory extends StatefulWidget {
  String name;
  String id;

  ChatHistory(this.id, this.name);

  @override
  State<ChatHistory> createState() => _ChatHistoryState(id, name);
}

class _ChatHistoryState extends State<ChatHistory> {
  String name;
  String id;

  _ChatHistoryState(this.id, this.name);

  int docListAmount = 0;

  Future<void> getDocListAmount(String id) async {
    final data = await FirebaseFirestore.instance.collection("_userData").doc(idGlobal).collection(id).get();
    setState(() {
      docListAmount = data.docs.length;
    });
    print(docListAmount);
  }

  @override
  void initState() {
    getDocListAmount(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
    if (docListAmount != 0) {
      print('in');
      for (int i = 0; i <= docListAmount; i++ ) {

      }
    }



    return Container();
  }
}









