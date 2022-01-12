
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:tweet_mobile_app/services/auth.dart'; 




class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {

  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  // render function
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7A0101), elevation: 8, title: const Text("IU Tweet Sign Up Page")),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 60),
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
                  onPressed: () async => {_authService.signUp(email, password)}),
              ElevatedButton(
                  child: const Text('Signin'),
                  onPressed: () async => {_authService.signIn(email, password)}),

            ],
          )),
        ));
  }
}
