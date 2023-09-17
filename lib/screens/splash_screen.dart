import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.whichSrceen});
  final Widget whichSrceen;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds:3), () =>
        Navigator.pushReplacement(context, PageTransition(child: widget.whichSrceen, type: PageTransitionType.leftToRightWithFade)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset('assets/animations/animation_lmlwlg1v.json'),
          ),
          const SizedBox(height: 10,),
          const Text('C H A T  Z E N',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),)
        ],
      ),

    );
  }
}

