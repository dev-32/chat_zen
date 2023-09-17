import 'package:chat_zen/screens/auth_screen.dart';
import 'package:chat_zen/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
FirebaseAuth _firebase = FirebaseAuth.instance;
class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key});

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         title: Text('C H A T Z E N'),
         actions: [
           IconButton(onPressed: ()async{
             await _firebase.signOut();
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SplashScreen(whichSrceen: AuthScreen())));
           }, icon: Icon(Icons.logout)),
         ],
       ),
      body: ChatScreen(),
    );
  }
}
