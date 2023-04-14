import 'package:shared_preferences/shared_preferences.dart';

Future<void> setPrefNew(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('id', id);
  print(id);
  print('pref saved!');
}




