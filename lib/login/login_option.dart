import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(49, 105, 245, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/google_icon.png',
                          scale: 50,
                          color: Colors.white,
                        ),
                        const Text(
                          'Continuar con Google',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF324fa5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Icon(Icons.facebook),
                        Text(
                          'Continuar con Facebook',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFF64686f), width: 3),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register_page');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Icon(
                            Icons.email,
                            color: Color.fromRGBO(100, 104, 111, 1),
                          ),
                          Text(
                            'Registrarse con e-mail',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(100, 104, 111, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20
          ),
          child: Column(children: <Widget>[
            SizedBox(
              height: 60,
              width: 250,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromRGBO(252, 20, 96, 1)),
                onPressed: () {},
                child: const Text(
                  'Entrar como invitado',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 250,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromRGBO(118, 167, 87, 1.0)),
                onPressed: () {},
                child: const Text(
                  'Entrar como vendedor',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
        
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 70),
          child: Row(
            children: <Widget>[
              const Text(
                '¿Ya tienes una cuenta?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_panel');
                },
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 20, 96, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
