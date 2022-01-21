
import 'package:flutter/material.dart';
import 'package:tweet_mobile_app/services/auth.dart';




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text("Home"),
        actions:  <Widget>[
          TextButton.icon(
            label: const Text('Sign Out', style: TextStyle(color:Colors.white)),
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () async {_authService.signOut();}, 
            ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {Navigator.pushNamed(context, '/add');},
      backgroundColor: Colors.red[900],
      child: const Icon(Icons.add),),
    );
  }
}