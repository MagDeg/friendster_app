import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendster_app/functions/shared_preferences.dart';

Future<String> generateID() async{
  String id = '00000000';
  var data = await FirebaseFirestore.instance.collection('_userData').doc(id).get();
  do {
    id = Random().nextInt(9).toString() + Random().nextInt(9).toString() + Random().nextInt(9).toString() + Random().nextInt(9).toString() + Random().nextInt(9).toString() + Random().nextInt(9).toString() + Random().nextInt(9).toString() +Random().nextInt(9).toString() +Random().nextInt(9).toString() + Random().nextInt(9).toString();
  } while(data.exists);
  setPrefNew(id);
  return id;
}

