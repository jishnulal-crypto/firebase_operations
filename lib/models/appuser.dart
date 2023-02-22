import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

class Appuser {
  
  Stream<User?>? get user => FirebaseAuth.instance.authStateChanges();
  
  UserCredential? userdetails;
  static UserCredential? userCredential;
  var verificationId;
  // static Future<bool> usegoogleauthprovider() async{

  //   bool success = false;
  //   GoogleAuthProvider authProvider = GoogleAuthProvider();
  //   authProvider.addScope('https://www.googleapis.com/');
  //   authProvider.setCustomParameters({
  //     'login-hint':'jishnu@webcastle.in'
  //   });
   
  //   try {
  //     userCredential = await FirebaseAuth.instance.signInWithPopup(authProvider);
  //   } catch (e) {
  //     print(e);
  //   }on FirebaseAuthException {
  //     print(" firebase auth exception$e");
  //   }
   
  //   if(userCredential!.user!.email != null){
  //     success = true;
  //     if(username !=null){
  //       username = "";
  //       username = userCredential!.user!.email;
  //     }
  //     else{
  //       username = userCredential!.user!.email;
  //     }
  //   }
  //   return  success;
  // }
  
 

  

}