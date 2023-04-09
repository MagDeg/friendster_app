import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendster_app/chats/single_chatpage/chat_history.dart';
import 'package:friendster_app/variables.dart';

class SingleChatPage extends StatefulWidget {

  String name;
  String id;

  SingleChatPage(this.name, this.id);

  @override
  State<SingleChatPage> createState() => _SingleChatPageState(name, id);
}

class _SingleChatPageState extends State<SingleChatPage> {

  String name;
  String id;

  final msgController = TextEditingController();



  Future<int> getDocListAmount(String id) async {
    final data = await FirebaseFirestore.instance.collection("_userData").doc(idGlobal).collection(id).get();

    return data.docs.length;


  }

  _SingleChatPageState(this.name, this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 20),),
            Text(id, style: TextStyle(fontSize: 12),)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle)),
        ],
      ),
      body: ChatHistory(id, name),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Form(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Geben sie ihre Nachicht ein.'),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: msgController,
                              ),
                            ),
                            Container(
                              width: 40.0,
                              child: FloatingActionButton(

                                  onPressed: () async {
                                    final db = FirebaseFirestore.instance.collection('_userData');

                                    int amount = await getDocListAmount(id);

                                    db.doc(idGlobal).collection(id).doc('msg' + amount.toString()).set({'content' : msgController.text, 'send' : true});
                                    db.doc(id).collection(idGlobal).doc().set({'content' : msgController.text, 'send' : false});

                                    msgController.clear();
                                    Navigator.pop(context);

                                    },
                                  child: Icon(Icons.send),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
