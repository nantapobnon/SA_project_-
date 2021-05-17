//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  double menufontsize = 20;
  int joke = 0, joke_egg = 0, Sjoke = 0, Sjoke_egg = 0, sum = 0;

  Future<Null> readData() async {
    //print("order${time}");
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("store_account")
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          joke = map["joke"];
          joke_egg = map["joke_egg"];
          Sjoke = map["Sjoke"];
          Sjoke_egg = map["Sjoke_egg"];
          sum = map["total_income"];
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
        appBar: AppBar(
          title: Text("ร้านโจ๊กชั้น"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "ยอดรวมวันนี้",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "โจ๊กหมูธรรมดา",
                    style: TextStyle(fontSize: menufontsize),
                  ),
                  Text(
                    joke.toString(),
                    style: TextStyle(fontSize: menufontsize),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "โจ๊กหมูพิเศษ",
                    style: TextStyle(fontSize: menufontsize),
                  ),
                  Text(
                    Sjoke.toString(),
                    style: TextStyle(fontSize: menufontsize),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "โจ๊กหมูธรรมดาใส่ไข่",
                    style: TextStyle(fontSize: menufontsize),
                  ),
                  Text(
                    joke_egg.toString(),
                    style: TextStyle(fontSize: menufontsize),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "โจ๊กหมูพิเศษใส่ไข่",
                    style: TextStyle(fontSize: menufontsize),
                  ),
                  Text(
                    Sjoke_egg.toString(),
                    style: TextStyle(fontSize: menufontsize),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "รวม " +
                        (joke + Sjoke + joke_egg + Sjoke_egg).toString() +
                        " ถุง / " +
                        sum.toString() +
                        " บาท",
                    style: TextStyle(fontSize: menufontsize),
                  ))),
              //Spacer(),
              Container(
                width: 500,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ยืนยัน",
                      style:
                          TextStyle(fontSize: 25, color: Colors.indigo[900])),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'deletedata');
                  },
                  child: Text("ลบข้อมูล",
                      style: TextStyle(fontSize: 25, color: Colors.red[900])),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[500],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// class Account extends StatelessWidget {
//   double menufontsize = 20;
//   int joke, joke_egg, Sjoke, Sjoke_egg, sum;

//   Future<Null> readData() async {
//     //print("order${time}");
//     await Firebase.initializeApp().then((value) async {
//       await FirebaseFirestore.instance
//           .collection("store_account")
//           .snapshots()
//           .listen((event) {
//         for (var snapshots in event.docs) {
//           Map<String, dynamic> map = snapshots.data();
//           joke = map["joke"];
//           joke_egg = map["joke_egg"];
//           Sjoke = map["Sjoke"];
//           Sjoke_egg = map["Sjoke_egg"];
//           sum = map["total_income"];
//           print(sum);
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     readData();
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("ร้านโจ๊กชั้น"),
//         ),
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           margin: EdgeInsets.all(40),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "ยอดรวมวันนี้",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "โจ๊กหมูธรรมดา",
//                     style: TextStyle(fontSize: menufontsize),
//                   ),
//                   Text(
//                     joke.toString(),
//                     style: TextStyle(fontSize: menufontsize),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "โจ๊กหมูพิเศษ",
//                     style: TextStyle(fontSize: menufontsize),
//                   ),
//                   Text(
//                     Sjoke.toString(),
//                     style: TextStyle(fontSize: menufontsize),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "โจ๊กหมูธรรมดาใส่ไข่",
//                     style: TextStyle(fontSize: menufontsize),
//                   ),
//                   Text(
//                     joke_egg.toString(),
//                     style: TextStyle(fontSize: menufontsize),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "โจ๊กหมูพิเศษใส่ไข่",
//                     style: TextStyle(fontSize: menufontsize),
//                   ),
//                   Text(
//                     Sjoke_egg.toString(),
//                     style: TextStyle(fontSize: menufontsize),
//                   )
//                 ],
//               ),
//               Container(
//                   margin: EdgeInsets.all(20),
//                   child: Center(
//                       child: Text(
//                     "รวม " +
//                         (joke + Sjoke + joke_egg + Sjoke_egg).toString() +
//                         "ถุง / " +
//                         sum.toString() +
//                         " บาท",
//                     style: TextStyle(fontSize: menufontsize),
//                   ))),
//               //Spacer(),
//               Container(
//                 width: 500,
//                 height: 50,
//                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("ยืนยัน",
//                       style:
//                           TextStyle(fontSize: 25, color: Colors.indigo[900])),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.pink[100],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
