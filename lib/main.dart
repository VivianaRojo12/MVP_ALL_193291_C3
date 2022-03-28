import 'package:flutter/material.dart';
import 'package:mvp_all/login/login.dart';
import 'package:mvp_all/login/login_two.dart';
import 'package:mvp_all/navigationPages/navigation.dart';
import 'package:mvp_all/passwordRecover/passRecover.dart';
import 'package:mvp_all/register/register.dart';
import 'package:mvp_all/colors/colors_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVP_APP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: ColorsViews.backgroundColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoarding(),
        '/login': (context) => const Login(),
        '/login_panel': (context) => const LoginPanel(),
        '/register_page': (context) => const RegisterPage(),
        '/recover_pass': (context) => const RecoverPass(),
      },
    );
  }
}
