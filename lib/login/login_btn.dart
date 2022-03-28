import 'package:flutter/material.dart';
import '../colors/colors_views.dart';

class ButtonIngresar extends StatelessWidget {
  const ButtonIngresar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('Ingresar',
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
    );
  }
}
