import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_mobile_app/models/user.dart';
import 'package:tweet_mobile_app/screens/auth/signup.dart';
import 'package:tweet_mobile_app/screens/main/Home.dart';
import 'main/posts/add.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    print(user);
    if(user == null){
      // show auth system routes
      return const SignUp();
    }
    
    // show main system routes
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) =>  Add(),
      },
    );
  }
}