import 'package:flutter/material.dart';
import 'package:friendster_app/authentication/new_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Column(
                children: const [
                  SizedBox(height: 20),
                  Center(child: SizedBox(height: 50, child: FittedBox( fit: BoxFit.contain, child: Text('Anmelden', style: TextStyle(color: Color.fromRGBO(191, 0, 191, 1)),),),)),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                                height: 60.0,
                                width: 130,
                                child: FittedBox(fit: BoxFit.contain, child: Text('Anmelden', style: TextStyle(color: Colors.black,)))),
                          )),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAccountPage()));
                  },
                  child: const Text("Ich habe noch kein Konto!", style: TextStyle(color: Color.fromRGBO(191, 0, 191, 1), fontSize: 20.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
