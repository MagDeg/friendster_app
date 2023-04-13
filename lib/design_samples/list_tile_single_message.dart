import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class SingleMessage extends StatelessWidget {
  String msg;
  bool send;

  SingleMessage(this.msg, this.send);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Bubble(
        style: BubbleStyle(
          nip: send ? BubbleNip.rightBottom : BubbleNip.leftBottom
        ),
        color: send ? Colors.purple : Colors.purpleAccent,
        child: Text(msg),),
    );
  }
}
