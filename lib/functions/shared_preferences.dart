import 'package:shared_preferences/shared_preferences.dart';
import '../variables.dart';

Future<void> setPrefNew(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('id', id);
  print(id);
}

Future<void> getPref() async{
  final prefs = await SharedPreferences.getInstance();
  idGlobal = await prefs.getString('id').toString();
}

