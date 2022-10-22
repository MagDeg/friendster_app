import 'package:flutter/material.dart';

class SuccessLogin extends StatelessWidget {
  final String text;

  const SuccessLogin(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                    child: Image.asset("assets/images/main_image.png")),
                const SizedBox(height: 100.0),
                Text(text, style: const TextStyle(color: Colors.white, fontSize: 20.0),),
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
              ],

            ),
          ),
        ),
      ),
    );
  }
}
