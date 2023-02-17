import 'package:flutter/material.dart';
import 'package:friendster_app/authentication/new_account_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                        SizedBox(height: 20.0),
                        Center(child: SizedBox(height: 50, child: FittedBox( fit: BoxFit.contain, child: Text('Willkommen bei', style: TextStyle(color: Colors.white),),),)),
                        Center(child: SizedBox(height: 50, child: FittedBox(fit: BoxFit.contain, child: Text('Friendster', style: TextStyle(color: Color.fromRGBO(191, 0, 191, 1)),),),)),
                      ],
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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAccountPage()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: SizedBox(
                                  height: 60.0,
                                  width: 130,
                                  child: FittedBox(fit: BoxFit.contain, child: Text('Weiter', style: TextStyle(color: Colors.black,)))),
                            )),
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text('Copyright by Magnus Degwerth & Jonas Luz', style: TextStyle(color: Colors.white),),
                            SizedBox(height: 5.0)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
