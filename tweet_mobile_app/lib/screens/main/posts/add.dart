import 'package:flutter/material.dart';
import 'package:tweet_mobile_app/services/posts.dart';





class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar
      appBar: AppBar(
        title: const Text('Add Your Tweet!'),
        backgroundColor: Colors.red[900],
        actions: <Widget> [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () async{
              _postService.savaPost(text); // save posts to Cloud Firestore
              Navigator.pop(context); // go back to home page once finsh posting
            }, 
            child: const Text('Tweet',))
        ],),


      // body 
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Form(
          child: TextFormField(
            decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  labelText: 'write something here..',
                ),
            onChanged: (val) {
              setState(() {
                text = val;
              });
            },
          )
          ),
      ),



      
    );
  }
}