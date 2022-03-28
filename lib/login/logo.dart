import 'package:flutter/material.dart';

// ignore: camel_case_types
class logo_app extends StatelessWidget {
  const logo_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100,),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Image.asset('assets/image/splash.png'),
      ),
    );
  }
}
