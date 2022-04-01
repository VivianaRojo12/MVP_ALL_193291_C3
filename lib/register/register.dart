import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/colors/colors_views.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _value = false;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
    _value = false;
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
        title: const Text('Regístrate'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 4, 
              bottom: 4, 
              right: 15
            ),
            child: Image.asset(
              'assets/image/splash.png',
              color: Colors.white,
            ),
          )
        ],
      ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewport){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewport.maxHeight+100
                ),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'Crea una cuenta nueva para empezar a usar la app',
                        style: TextStyle(
                          color: ColorsViews.textSubtitle,
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
                              left: 0,
                              right: 250,
                            ),
                            child: Text(
                              'Nombre',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle:
                                const TextStyle(color: ColorsViews.textSubtitle),
                                hintText: "Nombre completo",
                                fillColor: Colors.white70,
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
                              bottom: 10,
                              left: 0,
                              right: 175,
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
                              right: 25
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle:
                                const TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                                hintText: "Direccion de correo",
                                fillColor: Colors.white70,
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
                              bottom: 10,
                              left: 0,
                              right: 225,
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
                            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText:
                              !_passwordVisible, //This will obscure text dynamically
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 161, 161, 161),
                                ),
                                fillColor: Colors.white70,
                                // Here is key idea
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromARGB(255, 179, 179, 179),
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.only(
                              top: 10, 
                              left: 35, 
                              right: 25, 
                              bottom: 15),
                            child: Text(
                              'Las contraseñas deben de contener caracteres, numeros y simbolos con un minimo de 6 caracteres.',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 204, 203, 203),
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding:const EdgeInsets.only(top: 2, left: 15, right: 45, bottom: 25),
                            child: Row(
                              children: [
                                Checkbox(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  value: _value,
                                  onChanged: (v) {
                                    setState(() {
                                      _value = !_value;
                                      print(_value);
                                    });
                                  },
                                ),
                                const Flexible(child: conditionTerms()),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Crear cuenta',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18)),
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>((states) {
                                    return ColorsViews.buttonColor;
                                  }),
                                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                      if (states.contains(MaterialState.pressed)) {
                                        return Colors.grey;
                                      }
                                      return Colors.transparent;
                                    },
                                  ),
                                  shape:
                                  MaterialStateProperty.resolveWith<OutlinedBorder>(
                                        (_) {
                                      return RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55, top: 20),
                            child: Row(
                              children: const [
                                Flexible(
                                  child: loginPage(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }, 
        
      ),
    );
  }
}

// ignore: camel_case_types
class conditionTerms extends StatelessWidget {
  const conditionTerms({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(children: <InlineSpan>[
        const TextSpan(
          text: 'Al registrarme, acepto ',
          style: TextStyle(color: ColorsViews.textSubtitle),
        ),
        TextSpan(
          text: 'los términos y condiciones',
          style: const TextStyle(color: ColorsViews.barColorAble),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
        const TextSpan(
          text: ' y la ',
          style: TextStyle(color: ColorsViews.textSubtitle),
        ),
        TextSpan(
          text: 'política de privacidad.',
          style: const TextStyle(color: ColorsViews.barColorAble),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ]),
    );
  }
}

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  const loginPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: '¿Ya tienes una cuenta? ',
            style: TextStyle(
              color: ColorsViews.textSubtitle, 
              fontSize: 16),
          ),
          TextSpan(
            text: ' Iniciar sesión.',
            style: const TextStyle(
                color: ColorsViews.barColorAble, 
                fontSize: 16,
                fontWeight: FontWeight.bold,),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/login_panel');
              },
          ),
        ],
      ),
    );
  }
}