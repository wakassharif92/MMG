import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmg_bottomnavigation2/main.dart';
import 'package:hexcolor/hexcolor.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  bool test = false;
  late AnimationController controller;
  @override
  void initState() {
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BtmNavigationBar()));
    });
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: test
                      ? NetworkImage('www.google.com')
                      : AssetImage('assets/images/SplashScreenBackground.jpg')
                          as ImageProvider,
                  fit: BoxFit.fill)),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/MMGLogo.png'),

              ],
            ),
          ),

        ),
        Positioned.fill(
          top: 400.0,
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: HexColor('#FD42B4'),
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ),
        Positioned.fill(
          bottom: 50.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: Text(
                'Tap To Continue',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#B6C2D5')),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BtmNavigationBar()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
