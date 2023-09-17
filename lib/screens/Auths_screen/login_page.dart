import 'package:chat_zen/providers/auth_providers.dart';
import 'package:chat_zen/utils/text_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


FirebaseAuth _firebase = FirebaseAuth.instance;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _mail;
  late String _password;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder:( (context, test, child) => Scaffold(
        appBar: AppBar(
          title: const Text('L O G I N'),
        ),
        body:  Center(
          child: Column(
            children: [
              TextCont(hintText: 'Enter your email', prefixIcon: Icon(Icons.person),
                  obsecureText: false,
              formvalue: (value){
                setState(() {
                  _mail =value;
                });
              }),
              TextCont(hintText: 'Enter your password', prefixIcon: Icon(Icons.key),
                  obsecureText: true,
              formvalue: (value){
                _password = value;
              }),
              Container(
                margin: const EdgeInsets.only(top: 34),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton.icon(
                  icon: Icon(Icons.keyboard_double_arrow_right),
                    onPressed: ()=>test.authenticate(context, true, _mail, _password),
                    label:const Text('L O G I N',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),)),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
