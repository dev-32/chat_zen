
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/aftersign.dart';
FirebaseAuth _firebase = FirebaseAuth.instance;
class AuthProvider extends ChangeNotifier{

  void authenticate(BuildContext context,bool isLogin, String email, String password) async{
    try{
      if(isLogin) {
        await _firebase.signInWithEmailAndPassword(
            email: email, password: password);
        final userCredentials = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection('users').doc(
            userCredentials!.uid).set({
          'username': userCredentials.uid,
          'email': userCredentials.email,
        }, SetOptions(merge: true));
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AfterLogin()));
      }
      else{
        await _firebase.createUserWithEmailAndPassword(email: email, password: password);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AfterLogin()));
        final userCredentials = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection('users').doc(
            userCredentials!.uid).set({
          'username': userCredentials.uid,
          'email': userCredentials.email,
        });
      }
    } on FirebaseAuthException catch (error){

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ??
              'Authentication Failed',)));
    }
    notifyListeners();
  }
}