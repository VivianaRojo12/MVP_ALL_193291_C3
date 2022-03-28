import 'login_option.dart';
import 'logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const logo_app(),
          Column(children: const<Widget>[
            LoginOption(),
          ]),
        ],
      ),
    );
  }
}
