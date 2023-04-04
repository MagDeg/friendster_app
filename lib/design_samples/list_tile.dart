import 'package:flutter/material.dart';
import 'package:friendster_app/chats/single_chatpage/single_chatpage.dart';

class ListTileSample extends StatelessWidget {

  String name;
  String id;

  ListTileSample(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.purple,
        ),
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 20),),
              Text(id, style: TextStyle(fontSize: 12),)
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatPage(name, id)));
          },
        ),
      ),
    );
  }
}
