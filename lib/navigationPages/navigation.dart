import 'package:flutter/material.dart';
import '../colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String, String>> boardingData = [
    {
      'image': 'assets/onBoarding/B1.png',
      'text_header': 'ESPARCIMIENTO',
      'text': 'Brindamos todos los servicios para consentir a tu mascota'
    },
    {
      'image': 'assets/onBoarding/B2.png',
      'text_header': 'ADOPCION',
      'text':
          'Incididunt et velit minim minim laboris nisi ad nisi cupidatat nostrud'
    },
    {
      'image': 'assets/onBoarding/B3.png',
      'text_header': 'HOSPITALIDAD',
      'text':
          'Incididunt et velit minim minim laboris nisi ad nisi cupidatat nostrud'
    },
    {
      'image': 'assets/onBoarding/B4.png',
      'text_header': 'VETERINARIA',
      'text':
          'Incididunt et velit minim minim laboris nisi ad nisi cupidatat nostrud'
    },
    {
      'image': 'assets/onBoarding/B5.png',
      'text_header': 'TIENDA',
      'text': 'Todas las necesidades de tu mascota sin salir de casa.'
    },
  ];
  int pagePosition = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorsViews.backgroundColor,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller :_pageController,
                    onPageChanged: (value) => {
                      setState(() {
                        pagePosition = value;
                      })
                    },
                    itemBuilder: (context, index) => ContainerBoarding(
                      image: boardingData[index]['image']!,
                      text: boardingData[index]['text']!,
                      text_header: boardingData[index]['text_header']!,
                    ),
                    itemCount: boardingData.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            boardingData.length,
                            (index) => _animatedContainer(index),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120, bottom:20),
                          child: _nextButton(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _nextButton() {
    return SizedBox(
      width: 270,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          
          if (pagePosition < (boardingData.length - 1)) {
            pagePosition += 1;
            print(boardingData.length);
            print(pagePosition);
            setState(() {
              ContainerBoarding(
                image: boardingData[pagePosition]['image']!,
                text: boardingData[pagePosition]['text']!,
                text_header: boardingData[pagePosition]['text_header']!,
              );
            });
            _pageController.animateToPage(pagePosition, duration: const Duration(milliseconds: 450), curve: Curves.decelerate);
          }
          else {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: Text(
            pagePosition == (boardingData.length - 1)
                ? 'Continuar'
                : 'Siguiente',
            style: pagePosition == (boardingData.length - 1)
                ? const TextStyle(color: Color.fromRGBO(255, 255, 255, 1))
                : const TextStyle(color: ColorsViews.textSubtitle)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (pagePosition == (boardingData.length - 1)) {
              return ColorsViews.buttonColor;
            }
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return const Color.fromRGBO(0, 0, 0, 0);
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16));
            },
          ),
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int index) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 4,
      width: pagePosition == index ? 20 : 12,
      decoration: BoxDecoration(
          color: pagePosition == index
              ? ColorsViews.barColorAble
              : ColorsViews.barColorDisable),
      margin: const EdgeInsets.only(
        right: 8,
      ),
    );
  }
}

class ContainerBoarding extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String image, text, text_header;
  const ContainerBoarding({
    Key? key,
    required this.image,
    required this.text,
    // ignore: non_constant_identifier_names
    required this.text_header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Image.asset(image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              children: [
                Text(
                  text_header,
                  style: const TextStyle(
                    color: ColorsViews.textHeader,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorsViews.textSubtitle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
