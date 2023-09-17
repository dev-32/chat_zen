import 'package:chat_zen/providers/auth_providers.dart';
import 'package:chat_zen/utils/text_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../aftersign.dart';
FirebaseAuth _firebase = FirebaseAuth.instance;
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email;
  late String _password;
  late String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder:( (context, test, child) => Scaffold(
          appBar: AppBar(
            title: const Text('S I G N U P'),
          ),
          body: Column(
                children: [
                  SizedBox(
                    height: 200,
                      child: Lottie.asset('assets/animations/animation_lmlxxjj1.json')),
                  TextCont(hintText: 'Enter your email', prefixIcon: Icon(Icons.email),
                      obsecureText: false,formvalue: (value){
                    _email = value;
                    }, ),
                  TextCont(hintText: 'Create a password', prefixIcon: Icon(Icons.password) ,
                      obsecureText: true,
                  formvalue: (value){
                    _password = value;
                  }),
                  TextCont(hintText: 'Confirm password', prefixIcon: Icon(Icons.key),
                      obsecureText: true,
                  formvalue: (value){
                    _confirmPassword = value;
                  }),
                  Container(
                    margin: const EdgeInsets.only(top: 34),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextButton.icon(
                        icon: const Icon(Icons.keyboard_double_arrow_right),
                        onPressed: (){
                          if(_password != _confirmPassword){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Password not same',)));
                            return;
                          }
                          test.authenticate(context, false, _email, _password);},
                        label:const Text('S I G N U P',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),)),
                  ),
                ],
              ),
      )),
    );
  }
}
