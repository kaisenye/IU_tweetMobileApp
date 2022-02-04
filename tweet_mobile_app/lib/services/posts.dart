

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tweet_mobile_app/models/post.dart';


class PostService {
  



  // showcase the snapshot of all the posts
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return PostModel(
        id: doc.id,
        text: (doc.data() as dynamic)['text']?? '',
        creator: (doc.data() as dynamic)['creator'] ?? '',
        timestamp: (doc.data() as dynamic)['timestamp'] ?? 0,
      );
    }).toList();
  }

  Future savaPost(text) async{
    await FirebaseFirestore.instance.collection("post").add({
      'text': text,
      'creator': FirebaseAuth.instance.currentUser?.uid,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Stream<List<PostModel>> getPostsByUser(uid){
    return FirebaseFirestore.instance
    .collection("posts")
    .where('creator', isEqualTo: uid)
    .snapshots()
    .map(_postListFromSnapshot);
  }
}