import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_mobile_app/screens/main/posts/list.dart';
import 'package:tweet_mobile_app/services/posts.dart';






class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _postService.getPostsByUser(FirebaseAuth.instance.currentUser?.uid),
      initialData: const [],
      child: Scaffold(
        body: Container(
          child: const ListPosts(),
        ),
      ),
    );
  }
}