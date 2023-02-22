import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/appuser.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  void printusercredential(){
    // credential = Appuser.userCredential;
    print("${Appuser.userCredential!.user!.email}"); 
    print(Appuser.userCredential!.user!.displayName);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("profile page"),
              TextButton(onPressed: (){
                printusercredential();
              }, child: Text("show")),
            ],
          ),
        ),
      );
  }
}