import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendster_app/variables.dart';

class AddChat extends StatefulWidget {
  const AddChat({Key? key}) : super(key: key);

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  final targetName = TextEditingController();
  final targetId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(child: SizedBox(height: 50, child: FittedBox( fit: BoxFit.contain, child: Text('Chat Hinzufügen', style: TextStyle(color: Colors.white),),),)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Center(child: Text('Um einen neuen Chat hinzuzufügen, müssen sie in den Benutzernamen und die Benutzer ID des anderen Chatteilnehmers angeben.', style: TextStyle(color: Colors.white),),),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: targetName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  iconColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.account_circle, color: Color.fromRGBO(191, 0, 191, 1)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: targetId,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  iconColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "ID",
                  labelStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.key, color: Color.fromRGBO(191, 0, 191, 1)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 60.0,
                width: 300,
                padding: const EdgeInsets.all(10.0),
                child: RawMaterialButton(
                    fillColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.white)
                    ),
                    onPressed: () async {
                      var senderRef = await FirebaseFirestore.instance.collection("_userData").doc(idGlobal).get();

                      String sender = senderRef['name'];
                      
                      var data = await FirebaseFirestore.instance.collection('_userData').doc(targetId.text).get();
                      if(data.exists) {
                        if (data['name'] == targetName.text) {
                          FirebaseFirestore.instance.collection('_userData').doc(targetId.text).collection(idGlobal).doc('msg0').set({'content' : 'Der Nutzer $sender hat mit ihnen einen Chat gestartet!', 'send' : false});
                          FirebaseFirestore.instance.collection('_userData').doc(idGlobal).collection(targetId.text).doc('msg0').set({'content' : 'Sie haben mit dem Nutzer ' + targetName.text + ' einen Chat gestartet!', 'send' : true});
                          print("genNewFields");
                          FirebaseFirestore.instance.collection('_userData').doc(targetId.text).collection('_chats').doc(idGlobal).set({'sender' : senderRef['name'], 'senderID' : idGlobal});
                          FirebaseFirestore.instance.collection('_userData').doc(idGlobal).collection('_chats').doc(targetId.text).set({'sender' : targetName.text, 'senderID' : targetId.text});

                          Navigator.pop(context);
                        } else {
                          showDialog(context: context, builder: (context) => AlertDialog(content: Text("Der eingegebene Name existiert in Kombination mit der ID nicht!"),));
                        }
                      } else {
                        showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: Colors.redAccent, content: Text("Die eingegebene ID existiert nicht!"),));


                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: 60.0,
                          width: 130,
                          child: FittedBox(fit: BoxFit.contain, child: Text('Fertig', style: TextStyle(color: Colors.black,)))),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
