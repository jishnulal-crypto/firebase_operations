import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/fatherflutter/file.dart';
import 'package:project/models/appuser.dart';
import 'package:project/pages/firebase_login.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase(DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

 Future<FirebaseApp> initializeFirebase(FirebaseOptions firebaseOptions ) async {
      FirebaseApp firebaseApp =  await Firebase.initializeApp(options:firebaseOptions );
      return firebaseApp;
 }

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
      // home: Scaffold(
      //   appBar: AppBar(
      //     toolbarHeight: 100,
      //     centerTitle: true,
      //     title: Column(
      //       children: [
      //         Container(
      //           color: Colors.white,
      //           child: TextField(controller: emailcontroller,style: TextStyle(debugLabel: "email"),)
      //         ),
      //         Container(
      //           color: Colors.white,
      //           child: TextField(controller: passwordcontroller,style: TextStyle(debugLabel: "password"),)
      //         ),
      //         ElevatedButton(onPressed: (){
      //           Appuser.signInWithemailpass(emailcontroller.text ,passwordcontroller.text) == true ? Navigator.push(context, MaterialPageRoute(builder: (context){
      //             return Text("nextpage");
      //           })): print("somethings gone wrong !");
                
      //         }, child: Text(" Signin with email"))
      //       ],
      //     )
      //   ),),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void timer(){
    setState(() {
      Timer.periodic(Duration(seconds: 3), (timer) { 
        if (timer.tick == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return Login();
          })));
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue,
            height: 100,
          ),
          Center(child: Text("SplashScreen"))
        ],
      ),
    );
  }
}



class ListDynamicItems extends StatelessWidget {
   ListDynamicItems({Key? key}) : super(key: key);

  // List fooditems = ;

  Map<String,dynamic> items = {
     "items":["mango","apple","orange","banana"],
     "sub1":[],
     "sub2":["a","b","c","d"]
  };

  @override
  Widget build(BuildContext context) {

    List data = items["items"];

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width-200,
        child: Column(
          children: [
            Container(
                color: Colors.blue,
                width: double.infinity,
                height: 100,
                child: Text("data"),
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 200,
                child: ListView.builder(itemBuilder: (context,index){
                return Container(
                      alignment: Alignment.center,
                      color: Colors.amber[index*100],
                      height: 50,
                      width: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              color: Colors.blue,
                              child: Text("${items["items"][index]}"),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              color: Colors.green,child: Text("${items["sub2"][index]}"),)),
                           Expanded(
                            flex: 2,
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              color: Colors.yellow,child: Text("$index"),))
                        ],
                      ),
                    );
            }),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context ,index){
                    //0,1,2,3
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.amber[index*100],
                      height: 50,
                      width: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 20,
                              color: Colors.blue,
                              child: Text("${items["items"][index]}"),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,height:20,color: Colors.green,child: Text("${items["sub2"][index]}"),)),
                           Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,height:20,color: Colors.yellow,child: Text("$index"),))
                        ],
                      ),
                    );
              }),
            ),
            Text("data")
          ],
        ),
      ),
    );
  }
}



































// class ListViewWidgetFlutter extends StatelessWidget {
//   ListViewWidgetFlutter({Key? key}) : super(key: key);

//   Map<String,dynamic> data = {
//   "code": "200",
//   "message": "successful",
//   "home_content_data": [
//     {
//       "layout": "logo",
//       "title": "Logo",
//       "image_url": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/01/hattahoney_log.png",
//       "showMenu": true,
//       "showSearch": true,
//       "showLogo": true,
//       "color": "#15B309"
//     },
//     {
//       "layout": "carousel",
//       "title": "",
//       "isSlider": true,
//       "autoPlay": true,
//       "showNumber": false,
//       "design": "default",
//       "showBackGround": true,
//       "radius": 2,
//       "items": [
//         {
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/06/BOGO-Hatta-bannerEng.jpg",
//           "caption_tag": "",
//           "padding": 10,
//           "titleString": "First Slider",
//           "subtitleString": "",
//           "slider_button_url": "https://caddemiratesadvertising.com/hattahoney/promotions/",
//           "buttontext": ""
//         },
//         {
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/01/Banner-_-3.jpg",
//           "caption_tag": "HONEY STRAIGHT FROM THE HIVE",
//           "padding": 10,
//           "titleString": "Second Slider",
//           "subtitleString": "Pure, natural and deliciously healthy.",
//           "slider_button_url": "https://caddemiratesadvertising.com/hattahoney/promotions/",
//           "buttontext": "SHOP NOW"
//         }
//       ]
//     },
//     {
//       "layout": "horizontal_list_view_stack",
//       "title": "Stack Products",
//       "items": [
//         {
//           "id": 4786,
//           "title": "Ghaf Honey",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/01/Web_HH_Ghaf_1KG_001.jpeg",
//           "productPrice": "105",
//           "regularPrice": "",
//           "salePrice": ""
//         },
//         {
//           "id": 529,
//           "title": "Samar Honey",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/01/1kg.jpg",
//           "productPrice": "135",
//           "regularPrice": "",
//           "salePrice": ""
//         },
//         {
//           "id": 551,
//           "title": "Sidr Honey",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/01/Hatta-Honey-Sidr-2020-1-KG.png",
//           "productPrice": "120",
//           "regularPrice": "",
//           "salePrice": ""
//         },
//         {
//           "id": 10191,
//           "title": "Sidr Honey &#8211; Year of Tolerance (Limited Edition)",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/04/Honey-Pic-_-1.jpg",
//           "productPrice": "250",
//           "regularPrice": "250",
//           "salePrice": ""
//         },
//         {
//           "id": 10183,
//           "title": "Ramadan Gift Box",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/04/PIC-_-1.jpg",
//           "productPrice": "350",
//           "regularPrice": "500",
//           "salePrice": "350"
//         },
//         {
//           "id": 10081,
//           "title": "Mangrove Honey",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/03/mangrove-500g.jpg",
//           "productPrice": "105",
//           "regularPrice": "",
//           "salePrice": ""
//         },
//         {
//           "id": 5307,
//           "title": "Mixed Honey Gift Box",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/03/mix2.jpeg",
//           "productPrice": "300",
//           "regularPrice": "",
//           "salePrice": ""
//         },
//         {
//           "id": 5269,
//           "title": "Mixed Honey Gift Box 57 Jars 20 Grams",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/03/mix1.jpeg",
//           "productPrice": "350",
//           "regularPrice": "350",
//           "salePrice": ""
//         }
//       ]
//     },
//     {
//       "layout": "vertical_product_list",
//       "title": "Search by Category",
//       "items": {
//         "title1": "Honey",
//         "image1": "https://i0.wp.com/caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/06/honey1.webp?resize=150%2C150&ssl=1",
//         "caturl1": "https://caddemiratesadvertising.com/hattahoney/product-category/honey/",
//         "title2": "Hive Products",
//         "image2": "https://i0.wp.com/caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/06/hive2.webp?resize=150%2C150&ssl=1",
//         "caturl2": "https://caddemiratesadvertising.com/hattahoney/product-category/hive-products/",
//         "title3": "Promotions",
//         "image3": "https://i0.wp.com/caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/06/honey1.webp?resize=150%2C150&ssl=1",
//         "caturl3": "https://caddemiratesadvertising.com/hattahoney/promotions/"
//       }
//     },
//     {
//       "layout": "carousel",
//       "title": "Home News",
//       "items": [
//         {
//           "id": 10147,
//           "title": "Tips, Tricks and, Recipes to Enjoy a Healthy Ramadan! – Hatta Honey",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/04/honey-main.jpg",
//           "buttonUrl": "https://caddemiratesadvertising.com/hattahoney/tips-tricks-and-recipes-to-enjoy-a-healthy-ramadan-hatta-honey/"
//         },
//         {
//           "id": 6050,
//           "title": "Pure honey crystallizes, and that’s normal!",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2022/03/ht.jpg",
//           "buttonUrl": "https://caddemiratesadvertising.com/hattahoney/pure-honey-crystallizes-and-thats-normal/"
//         },
//         {
//           "id": 3104,
//           "title": "Diana and Roma learn about bees at Hatta Honeybee Garden and Discovery Center!",
//           "image": "https://caddemiratesadvertising.com/hattahoney/wp-content/uploads/2021/04/blogs-article_diana-and-Roma.jpeg",
//           "buttonUrl": "https://caddemiratesadvertising.com/hattahoney/diana-and-roma-learn-about-bees-at-hatta-honeybee-garden-and-discovery-center/"
//         }
//       ]
//     },
//     {
//       "layout": "home_feature",
//       "title": "Featured Icons",
//       "items": [
//         {
//           "icon": "<i class='icon-credit-card'></i>",
//           "title": "Pay in installments with Tabby"
//         },
//         {
//           "icon": "<i class='icon-shield-check'></i>",
//           "title": "Secure Payment"
//         },
//         {
//           "icon": "<i class='icon-cash-dollar'></i>",
//           "title": "Cash on Delivery"
//         },
//         {
//           "icon": "<i class='icon-earth'></i>",
//           "title": "Delivery all over UAE"
//         }
//       ]
//     }
//   ],
//   "Setting": {
//     "MainColor": "#dea900",
//     "FontFamily": "Open Sans",
//     "ProductListLayout": "list",
//     "StickyHeader": false,
//     "ShowChat": false
//   },
//   "delivery_charges": "25",
//   "searchSuggestion": [
//     ""
//   ]
// };

//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//         body: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index){
//             var item = data["home_content_data"][index]["items"][index];
//             return Container(
//               child: Text("${item}"),
//           );
//         }),
//       );
//   }
// }





