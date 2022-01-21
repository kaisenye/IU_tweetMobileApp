
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

  get body => null;

  @override
  // render function
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800], elevation: 8, title: const Text("IU Tweet Sign Up Page")),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 60),
          child: Form(
              child: Column(
            children: <Widget> [

              Image.asset('lib/assets/images/iuLogo.png', height: 100,),

              const SizedBox(height:40,),

              Text('Create account / Sign in',
                          style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

              const SizedBox(height:40,),


              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),

              const SizedBox(height:10,),
              
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),

              const SizedBox(height:15,),

              // signup button
              ElevatedButton(
                  child: const Text('Sign up'),
                  onPressed: () async => {_authService.signUp(email, password)},
                  style: ElevatedButton.styleFrom(primary: Colors.red[900],),
              ),

              const SizedBox(height:20,),
              
              // signin button
              ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () async => {_authService.signIn(email, password)},
                  style: ElevatedButton.styleFrom(primary: Colors.red[900],),
              ),
                  

            ],
          )),
        ));
  }
}
