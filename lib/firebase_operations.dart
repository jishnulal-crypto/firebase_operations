import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/firebase_options.dart';
import 'package:project/models/appuser.dart';

class FirebaseOperation {
  
  UserCredential get userdetails => Appuser.userCredential!;

  
  

  static Future<bool> signinwithphonenumber({String? email ,String? password}) async{

  print("signin with phonenumber");
  //    RecaptchaVerifier recaptchaVerifier =  RecaptchaVerifier(
  //   container: 'recptcha',
  //   onError: (e) {
  //     print(e);
  //   },
  //   onExpired: () => print("Expired"),
  //   onSuccess: () => print("Success"),
  //   size: RecaptchaVerifierSize.compact,
  //   theme: RecaptchaVerifierTheme.light,
  // ),



    
    await FirebaseAuth.instance.signInWithPhoneNumber("9745140187" ,).then((value) async {
         ConfirmationResult  confirmationResult  = value;
         await confirmationResult.confirm(confirmationResult.verificationId).then((value) {
            Appuser.userCredential = value;
         });
    },).catchError((error){
      print(error);
    });
    return Appuser.userCredential!.user!.email !=null ? true :false;
  } 


  static Future<bool> createUserWithEmailAndPassword({String? email ,String? password}) async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!).then((value) {
         Appuser.userCredential = value;
    },).catchError((error){
      print(error);
    });

    return Appuser.userCredential!.user!.email !=null ? true :false;
  } 

  static Future<bool> signInWithPhoneNumber({String? email ,String? password }) async{
     
    await FirebaseAuth.instance.signInWithPhoneNumber("9745140187").then((value) async{
    Appuser.userCredential = await value.confirm(value.verificationId.toString()); 
    });
    print(Appuser.userCredential!.user);
      
    return Appuser.userCredential!.user!.email !=null ? true :false;
  }

   static Future<bool> signInWithemailpass({String? email ,String? password }) async{
     
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!,password: password!).then((value) {
      Appuser.userCredential = value;
    });
   
    print(Appuser.userCredential!.user);
      
    return Appuser.userCredential!.user!.email !=null ? true :false;
  }

  
  static  Future<bool> signInWithGoogle() async {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        Appuser.userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        
        // Once signed in, return the UserCredential
          return Appuser.userCredential!.user!.email !=null ? true :false;
      }
      
  }

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
 

  // Future<void> signup() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   // final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
       
  //     // Getting users credential
  //     Appuser.userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential); 
      
  //     // if (result != null) {
  //     //   Navigator.pushReplacement(
  //     //       context, MaterialPageRoute(builder: (context) => HomePage()));
  //     // }  // if result not null we simply call the MaterialpageRoute,
  //       // for go to the HomePage screen
  //   }
