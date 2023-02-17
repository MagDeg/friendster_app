import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendster_app/authentication/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendster_app/authentication/success_login_screen.dart';
import 'package:friendster_app/design_samples/text_field_design_dark.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final pinController = TextEditingController();
  final pinControllerSave = TextEditingController();
  final codeController = TextEditingController();

  String id = '';

  getAccessToken() async {
    final db = await FirebaseFirestore.instance.collection('_tokens').doc('accessTokens');
    final data = await db.get();
    print(data.data()?['id']);
    id = data.data()?['id'];


  }



  @override
  Widget build(BuildContext context) {

    getAccessToken();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              Column(
                children: const [
                  SizedBox(height: 20),
                  Center(child: SizedBox(height: 50, child: FittedBox( fit: BoxFit.contain, child: Text('Konto erstellen', style: TextStyle(color: Color.fromRGBO(191, 0, 191, 1)),),),)),
                ],
              ),
              const SizedBox(height: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: nameController,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        iconColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Kontoname",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.account_circle, color: Color.fromRGBO(191, 0, 191, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: mailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                            ? 'Bitte gib eine gültige E-Mail ein!'
                            : null,
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
                        labelText: "E-Mail",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.mail, color: Color.fromRGBO(191, 0, 191, 1)),

                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: pinController,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        iconColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Passwort",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.password, color: Color.fromRGBO(191, 0, 191, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: pinControllerSave,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        iconColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Passwort bestätigen",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.password, color: Color.fromRGBO(191, 0, 191, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: codeController,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        iconColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Zugangscode",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.key, color: Color.fromRGBO(191, 0, 191, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
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
                          onPressed: () {
                            ///TODO: Check if mail is already in use!

                            if (pinController.text.trim() == pinControllerSave.text.trim()){
                              if (codeController.text.trim() == id) {
                                FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: mailController.text.trim(),
                                    password: pinController.text.trim(),
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessLogin('Ihr Konto wurde erfolgreich erstellt!')));
                              } else {
                                Message.showSnackbar('Der Zugangscode ist ungültig!');
                              }


                            } else {
                                Message.showSnackbar('Die beiden Passwörter stimmen nicht überein!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                                height: 60.0,
                                width: 130,
                                child: FittedBox(fit: BoxFit.contain, child: Text('Konto erstellen', style: TextStyle(color: Colors.black,)))),
                          )),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: const Text("Ich habe bereits ein Konto!", style: TextStyle(color: Color.fromRGBO(191, 0, 191, 1), fontSize: 20.0), ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String? text) {
    if (text == null) return;
    final snackbar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messangerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackbar);
  }
}