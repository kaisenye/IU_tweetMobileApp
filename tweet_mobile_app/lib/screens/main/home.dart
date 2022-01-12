
import 'package:flutter/material.dart';
import 'package:tweet_mobile_app/services/auth.dart';




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions:  <Widget>[
          ElevatedButton.icon(
            label: const Text('SignOut'),
            icon: const Icon(Icons.person),
            onPressed: () async {_authService.signOut();}, 
            ),
        ],
      )
    );
  }
}