import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/colors/colors_views.dart';
import 'login_btn.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsViews.textHeader,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsViews.barColorAble,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Iniciar sesión'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, right: 15),
            child: Image.asset(
              'assets/image/splash.png',
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(
              top: 18, 
              left: 24,
              right: 10, 
              bottom: 18),
            child: Text(
              'Inicia sesión en tu cuenta para continuar',
              style: TextStyle(
                color: Color.fromARGB(255, 117, 113, 113),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: Column(
              key: _formKey,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 180,
                  ),
                  child: Text(
                    'Correo electrónico',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25, 
                    right: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                      hintText: "Email Adress",
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.702),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 230,
                    bottom: 10,
                  ),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25, 
                    right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText:
                        !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 161, 161, 161),
                      ),
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.702),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(255, 179, 179, 179),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 100,
                    right: 19),
                  child: Row(
                    children: const [
                      Flexible(
                        child: forgotten_password()),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 185),
                  child: ButtonIngresar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 45,
                    right: 10),
                  child: Row(
                    children: const [
                      Flexible(
                        child: registerOpt(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class forgotten_password extends StatelessWidget {
  const forgotten_password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        children: <InlineSpan>[
        TextSpan(
          text: '¿Has olvidado tu contraseña?',
          style: const TextStyle(
              color: ColorsViews.barColorAble,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()..onTap = () {Navigator.pushNamed(context, '/recover_pass');},
        ),
      ]),
    );
  }
}

// ignore: camel_case_types
class registerOpt extends StatelessWidget {
  const registerOpt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: '¿Todavia no tienes cuenta? ',
            style: TextStyle(
              color: ColorsViews.textSubtitle,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Regístrate.',
            style: const TextStyle(
                color: ColorsViews.barColorAble, 
                fontSize: 16, 
                fontWeight: FontWeight.bold,),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/register_page');
              },
          ),
        ],
      ),
    );
  }
}