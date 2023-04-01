import 'package:flutter/material.dart';

class AddChat extends StatefulWidget {
  const AddChat({Key? key}) : super(key: key);

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
