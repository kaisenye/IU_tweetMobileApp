import 'package:firebase_auth/firebase_auth.dart';
import 'package:tweet_mobile_app/models/user.dart';






class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  
  UserModel? _userFromFirebaseUser(User? user){
    // ignore: unnecessary_null_comparison
    return user != null ? UserModel(id: user.uid) : null;
  }


  // user stream with provider
  Stream<UserModel?> get user{
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }


  // signIn
  Future signUp(email, password) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
        email: email, password: password)) as User;

      _userFromFirebaseUser(user);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // signUp
  Future signIn(email, password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
        email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // signOut
  Future signOut() async {
    try{
      return await auth.signOut();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

}