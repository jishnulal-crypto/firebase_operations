import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/firebase_operations.dart';
import 'package:project/main.dart';
import 'package:project/models/appuser.dart';
import 'package:project/pages/details_page.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  TextEditingController? emailcontroller;
  TextEditingController? passwordController;
  bool islogout = false;

  Future<bool> logout() async{
    try {
      FirebaseAuth.instance.signOut();
      islogout = true;   
    } catch (e) {
    }on FirebaseException{
      print(e);
    }
    return islogout;
  }

  Future<bool> createuser() async{
      bool checked = false;
      try {
       checked = await FirebaseOperation.createUserWithEmailAndPassword(email:emailcontroller!.text ,password: passwordController!.text);    
      } catch (e) {
        print(e);
       }on FirebaseAuthException{
          print(" exception on user credential ");
       }
     return checked;
  }

  Future<bool> authenticateUserLogin() async{
      bool checked = false;
      try {
       checked = await FirebaseOperation.signInWithemailpass(email:emailcontroller!.text ,password: passwordController!.text);    
      } catch (e) {
       print(e);
       }on FirebaseAuthException{
          print(" exception on user credential $e");
       }
     return checked;
  }


  @override
  void initState() {
    emailcontroller = TextEditingController(text: "jishnu@webcastle.in".trim());
    passwordController = TextEditingController(text: "webcastle1234".trim());
    // FirebaseOperation.createUserWithEmailAndPassword(email: emailcontroller!.text ,password: passwordController!.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: Firebase.initializeApp(),
      builder: (context , asyncSnapshot){

      StreamSubscription<User?> user = FirebaseAuth.instance.authStateChanges().listen(((user) {
              
      }));        
        return Scaffold(
        appBar: AppBar(actions: [
          ElevatedButton(onPressed: () async{
            await logout() == true ? print("exited"):null;
          }, child: Text("logout"))
        ],),
        body: Container(
          child: Column(
            children: [
              TextField(controller: emailcontroller,decoration: InputDecoration(
                hintText: "email"
              ),),
              TextField(controller: passwordController,decoration: InputDecoration(
                hintText: "password"
              ),),
              Row(
                children: [
                  
                  ElevatedButton(onPressed: (() async{
                    await authenticateUserLogin() == true ? Navigator.push(context, MaterialPageRoute(builder: ((context) {
                       return  DetailsPage();
                    }))) : null;
                  }), child: Text("login")),
                   ElevatedButton(onPressed: (() async{
                    await createuser() == true ? Navigator.push(context, MaterialPageRoute(builder: ((context) {
                       return  DetailsPage();
                    }))) : null;
                  }), child: Text("create")),
                  ElevatedButton(onPressed: (() async{
                    await FirebaseOperation.signinwithphonenumber() == true ? Navigator.push(context, MaterialPageRoute(builder: ((context) {
                       return  DetailsPage();
                    }))) : null;
                  }), child: Text("mobile")),
                   ElevatedButton(onPressed: (() async{
                    await FirebaseOperation.signInWithGoogle() == true ? Navigator.push(context, MaterialPageRoute(builder: ((context) {
                       return  DetailsPage();
                    }))) : null;
                  }), child: Text("google")),
                  // ElevatedButton(onPressed: (){
                  //   FirebaseOperation.signInWithGoogle() == true ?  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  //      return  DetailsPage();
                  //   }))) : null;
                  // }, child: Text("google"))
                ],
              )
              
            ],
          ),
        ),
      );
      },
    );
  }
}


