
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FirebaseAuth auth = FirebaseAuth.instance;
  
  void signUpAction() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }


  String email = '';
  String password = '';

  @override
  // render function
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, elevation: 8, title: const Text("Sign Up")),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),

              TextFormField(
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),

              ElevatedButton(
                  child: const Text('Signup'),
                  onPressed: () async => {signUpAction()}),
              ElevatedButton(
                  child: const Text('Signin'),
                  onPressed: () async => {signUpAction()}),

            ],
          )),
        ));
  }
}
