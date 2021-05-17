import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_project/userdata.dart';

class displaydata {
  String number;
  List<int> quan = [0, 0, 0, 0, 0, 0, 0, 0];
  // displaydata(
  //     String n, int a, int b, int c, int d, int e, int f, int h, int i) {
  //   number = n;
  //   quan[0]=a;
  //   quan[1]=b;
  //   quan[2]=c;
  //   quan[3]=d
  // }
}

class Order_list extends StatefulWidget {
  @override
  _Order_listState createState() => _Order_listState();
}

class _Order_listState extends State<Order_list> {
  int limit, order_left = 0;
  int count = 0;
  static List<displaydata> data = [];
  static displaydata temp;
  String s;
  //displaydata temp = new displaydata();
  List<String> product_name = [
    "โจ๊กหมูธรรมดา",
    "โจ๊กหมูธรรมดาใส่ไข่",
    "โจ๊กหมูพิเศษ",
    "โจ๊กหมูพิเศษใส่ไข่",
    "ไข่ไก่",
    "ไข่เยี่ยวม้า",
    "หมู",
    "ตับ"
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   readlimit();
  // }

  // Future<Null> readData(String time) async {
  //   print("order${time}");
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseFirestore.instance
  //         .collection("order${time}")
  //         .snapshots()
  //         .listen((event) {
  //       for (var snapshots in event.docs) {
  //         Map<String, dynamic> map = snapshots.data();
  //         //print("order");
  //         temp.number = map["number"];
  // temp.quan[0] = map["joke"];
  // temp.quan[1] = map["joke_egg"];
  // temp.quan[2] = map["Sjoke"];
  // temp.quan[3] = map["Sjoke_egg"];
  // temp.quan[4] = map["egg"];
  // temp.quan[5] = map["pre_egg"];
  // temp.quan[6] = map["pork"];
  // temp.quan[7] = map["liver"];
  //         //print(temp.number);
  //         setState(() {
  //           //data.add(temp);
  //           //s = temp.number;
  //           count = count + 1;
  //         });
  //         break;
  //       }
  //     });
  //   });
  // }

  Future<Null> readlimit(String time) async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order" + time)
          .snapshots()
          .listen((event) {
        print("limit" + limit.toString());
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          setState(() {
            count = count + 1;
            order_left = order_left - 1;
          });
        }
      });
    });
  }

  void calleft() {
    order_left = limit - count;
    print(count);
    if (order_left < 0) order_left = 0;
    // setState(() {
    //   order_left = order_left;
    // });
    //return order_left.toString();
  }

  @override
  Widget build(BuildContext context) {
    List<String> time = ModalRoute.of(context).settings.arguments;
    //readlimit(time[1]);
    //readData(time[1]);
    //readlimit();
    s = time[1];
    limit = int.parse(time[0]);
    //order_left = limit - count;
    order_left = limit;
    //if (order_left < 0) order_left = 0;
    print(time[1]);
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านโจ๊กชั้น"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(time[1] + "0",
                        style:
                            TextStyle(fontSize: 25, color: Colors.brown[700])),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("รับจำนวนทั้งหมด :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(limit.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 400,
              child: Container(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("order" + time[1])
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        //print("inif");
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      } else {
                        print("inelse");
                        print("dawawd");
                        return ListView(
                          children: snapshot.data.docs.map((document) {
                            // print("dawawd");
                            // print(document["joke"]);
                            // print(document["joke_egg"]);
                            // print(document["Sjoke"]);
                            // print(document["Sjoke_egg"]);
                            // print(document["joke"]);
                            // print(document["joke"]);
                            // print(document["joke"]);
                            count++;
                            // order_left = order_left - 1;
                            return Container(
                                child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("No. $count : ",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(document["number"],
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                if (document["joke"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - โจ๊กธรรมดา",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["joke"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["joke_egg"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - โจ๊กธรรมดาใส่ไข่",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["joke_egg"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["Sjoke"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - โจ๊กพิเศษ",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["Sjoke"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["Sjoke_egg"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - โจ๊กพิเศษใส่ไข่",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["Sjoke_egg"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["egg"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - ไข่ไก่",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["egg"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["pre_egg"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - ไข่เยี่ยวม้า",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["pre_egg"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["pork"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - หมู",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["pork"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                if (document["liver"] != 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("            - ตับ",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(document["liver"].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                              ],
                            ));
                          }).toList(),
                        );
                      }
                    }),
              ),
            ),

            // Container(
            //   margin: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("ว่าง :",
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           )),
            //       Text((order_left < 0) ? "0" : order_left.toString(),
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.bold,
            //           )),
            //     ],
            //   ),
            // ),
            Spacer(),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   width: 300,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // s = "16.0";
            //       FirebaseFirestore.instance
            //           .collection('order_limit')
            //           .doc("a9IrmFCV4nBMMXxYLQSZ")
            //           .update({s: false});
            //       print(s);
            //       Navigator.pop(context);
            //     },
            //     child: Text("ปิดรับออเดอร์",
            //         style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.indigo[900])),
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.pink[100],
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //   ),
            // ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ย้อนกลับ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[700])),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
