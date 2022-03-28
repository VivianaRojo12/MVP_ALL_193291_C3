
import 'package:flutter/material.dart';
import 'package:mvp_all/colors/colors_views.dart';

class RecoverPass extends StatefulWidget {
  const RecoverPass({Key? key}) : super(key: key);

  @override
  State<RecoverPass> createState() => _RecoverPassState();
}

class _RecoverPassState extends State<RecoverPass> {
  final _formKey = GlobalKey<FormState>();
  @override
  // ignore: must_call_super
  void initState() {
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
        title: const Text('Recuperar contraseña'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, right: 15),
            child: Image.asset(
              'assets/image/splash.png',
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(
              top:18, 
              left: 25,
              right: 45,
              bottom: 18,),
            child: Text(
              'Ingresa tu email para restablecer tu contraseña.',
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
                    right: 170,
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
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                      hintText: "Dirección de correo",
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
                  padding:
                      EdgeInsets.only(
                        top: 10, 
                        left: 30, 
                        right: 13, 
                        bottom: 15),
                  child: Text(
                    'Ingrese su correo electronico registrado y le enviaremos un correo electronico con un enlace que contiene un enlace para restablecer su contraseña.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 204, 203, 203),
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 285),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Enviar Solicitud',
                          style: TextStyle(
                              color: ColorsViews.backgroundColor,
                              fontSize: 18)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return ColorsViews.buttonColor;
                        }),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(158, 158, 158, 1);
                            }
                            return const Color.fromRGBO(0, 0, 0, 0);
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
              ],
            ),
          )
        ],
      ),
    );
  }
}