// import 'package:firebase_database/firebase_database.dart';

// class Database {

//   var userdata;

//   Future getuserdata() async{
//     final ref = FirebaseDatabase.instance.ref();
//     final snapshot = await ref.child('users/').get();
//     if (snapshot.exists) {
//         userdata = snapshot.value;
//         print(snapshot.value);
//     } else {
//         print('No data available.');
//     }
//   }
// }