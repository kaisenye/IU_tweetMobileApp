
import 'package:flutter/material.dart';
import 'package:tweet_mobile_app/services/auth.dart';




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(

      // appBar
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text("Home"),
        ),
        centerTitle: false,
      ),
    
    // add post button
    floatingActionButton: FloatingActionButton(
      onPressed: () {Navigator.pushNamed(context, '/add');},
      backgroundColor: Colors.red[900],
      child: const Icon(Icons.add),),
    
    // drawer
    drawer: Drawer(
      child: ListView(
        children: <Widget> [
          DrawerHeader(
            child: const Text('Header'), 
            decoration: BoxDecoration(color: Colors.red[900]),
          ),
          ListTile(
            title: const Text('Profile'), 
            onTap: () {Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: const Text('Logout'), 
            onTap: () async {_authService.signOut();},
          ),
        ],
      ),
    ),
    
  );
  }
}