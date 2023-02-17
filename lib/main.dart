import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendster_app/authentication/new_account_page.dart';
import 'authentication/auth_page.dart';
import 'main_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FriendsterMain());
}

class FriendsterMain extends StatefulWidget {
  const FriendsterMain({Key? key}) : super(key: key);

  @override
  State<FriendsterMain> createState() => _FriendsterMainState();
}

class _FriendsterMainState extends State<FriendsterMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Message.messangerKey,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return const MainScreen();
            } else {
              return const AuthPage();
            }
          },
        )
      ),
    );
  }
}
