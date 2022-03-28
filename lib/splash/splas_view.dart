import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../navigationPages/navigation.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _toOnbording();
    _image('assets/image/splash.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CustomPaint(
            painter: _SplashCanvas(image),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      ),
    );
  }

  _image(String path) async{
    final data = await rootBundle.load(path); 
    final bits = data.buffer.asUint8List();
    final image = await decodeImageFromList(bits);
    setState(() {
      this.image = image;
    });
  }
}

class _SplashCanvas extends CustomPainter {

  // ignore: non_constant_identifier_names
  final ui.Image? image_canvas;

  const _SplashCanvas(this.image_canvas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const ui.Color.fromRGBO(118, 171, 86, 1);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.1);

    path.quadraticBezierTo(size.width * 0.15, size.height * 0.18,
        size.width * 0.35, size.height * 0.13);

    path.quadraticBezierTo(size.width * 0.55, size.height * 0.07,
        size.width * 0.8, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.13, size.width, size.height * 0.12);

    path.lineTo(size.width, 0);

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.75, size.width, size.height);

    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);

    final centerX = image_canvas != null
        ? (size.width - (image_canvas!.width * 0.25)) * 2
        : 0.0;
    final centery = image_canvas != null
        ? (size.height - (image_canvas!.height * 0.25)) * 2
        : 0.0;

    if (image_canvas != null) {
      canvas.drawImage(image_canvas!, Offset(centerX, centery), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}