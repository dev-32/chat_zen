import 'package:chat_zen/screens/Auths_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'Auths_screen/signup_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _gotoLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
  }
  void _gotoSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Already have an account?',
                      style: TextStyle(color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),),
                    GestureDetector(
                      onTap: _gotoLogin,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 33, vertical: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54, width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            'L O G I N',
                            style: TextStyle(fontSize: 22),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border:  Border.all(color: Colors.black),
                  color: Colors.black),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Create an account >>',
                      style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),),
                    GestureDetector(
                      onTap: _gotoSignUp,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 33,vertical: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Text('S I G N U P',
                            style: TextStyle(
                                fontSize: 22,
                              color: Colors.white
                            ),)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
