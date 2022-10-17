import 'package:flutter/material.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final pinController = TextEditingController();
  final codeController = TextEditingController();

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
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: mailController,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAccountPage()));
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
                  onPressed: () {},
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
