import 'package:flutter/material.dart';
import 'package:friendster_app/chats/single_chatpage/chat_history.dart';

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

    );
  }
}
