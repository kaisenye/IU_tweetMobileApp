import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_mobile_app/models/post.dart';
import 'package:tweet_mobile_app/services/posts.dart';





class ListPosts extends StatefulWidget {
  const ListPosts({Key? key}) : super(key: key);

  @override
  _ListPostsState createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  @override
  Widget build(BuildContext context) {
    List<PostModel> posts = Provider.of<List<PostModel>>(context) ?? [];
    // if (widget.post != null) {
    //   posts.insert(0, widget.post);
    // }

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.creator),
          subtitle: Text(post.text),
        );
      },
    ); 
  }
}