import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6 ,
                  child: Image.asset("/Users/cemilfatih/src/Earthquake/lib/assets/logo/logo.png")),
            )
          ],

        ),
      ),

    );
  }
}
