import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Expanded(child: ChatHistory(id, name)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 80.0,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white10
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              children: [
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  maxLines: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                    isDense: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    alignLabelWithHint: true,
                                    labelText: 'Nachricht',
                                    border: InputBorder.none,
                                  ),
                                  controller: msgController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        child: FloatingActionButton(

                          onPressed: () async {
                            final db = FirebaseFirestore.instance.collection('_userData');

                            int amount = await getDocListAmount(id);

                            db.doc(idGlobal).collection(id).doc('msg' + amount.toString()).set({'content' : msgController.text, 'send' : true, 'date' : DateTime.now()});
                            db.doc(id).collection(idGlobal).doc('msg' + amount.toString()).set({'content' : msgController.text, 'send' : false, 'date' : DateTime.now()});

                            msgController.clear();

                          },
                          child: Icon(Icons.send),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
