import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendster_app/design_samples/list_tile_single_message.dart';
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

  late var docs;

  final listViewScrollController = ScrollController();

  Future<void> getDocListAmount(String id) async {
    final data = await FirebaseFirestore.instance.collection("_userData").doc(idGlobal).collection(id).get();
    setState(() {
      docListAmount = data.docs.length;
    });
    print(docListAmount);
    docs = data;
  }

  @override
  void initState() {
    getDocListAmount(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('_userData').doc(idGlobal).collection(id).orderBy('date', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          } else

            return ListView(
                reverse: true,

                children: snapshot.data!.docs.map((data) {
                print(data['content']);

              double width = MediaQuery.of(context).size.width;

              return Align(
                alignment: data['send'] ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      //color: Colors.purpleAccent
                    ),
                    width: width/2,
                    child: SingleMessage(data['content'], data['send']),
                  ),
                ),
              );

            }).toList(),
          );
        });
  }
}









