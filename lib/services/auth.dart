import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get user{
      return _auth.authStateChanges();
  }
  Future SignInCredentials(String email,String password)async{
    try{
      UserCredential usr = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return usr;
    }
    catch(e){return null;}
  }

  Future Login(String email,String password)async{
    try{
      UserCredential usr = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return usr;
    }
    catch(e){return null;}
  }
  //signout
  Future SignOut() async{
    try{
      await _auth.signOut();
      return 1;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}