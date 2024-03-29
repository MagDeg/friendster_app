import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendster_app/authentication/new_account_page.dart';
import 'package:friendster_app/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/auth_page.dart';
import 'main_screen.dart';
import 'package:friendster_app/functions/shared_preferences.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      routes: {
        '/main' : (_) => MainScreen(),
        '/firstPage' : (_) => FriendsterMain(),
        '/auth' : (_) => AuthPage(),
      }

      ,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Message.messangerKey,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: FriendsterMain()
  )
  );
}

class FriendsterMain extends StatefulWidget {
  const FriendsterMain({Key? key}) : super(key: key);


  @override
  State<FriendsterMain> createState() => _FriendsterMainState();
}

class _FriendsterMainState extends State<FriendsterMain> {

  Future<void> getPref() async{
    final prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString('id').toString();
    setState(() {
      idGlobal = id;
      print('got pref');
      print(idGlobal);
    });


  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)  {


            if(snapshot.hasData) {

              return MainScreen();
            } else {

              return AuthPage();
            }
          },
        )
    );
  }
}


