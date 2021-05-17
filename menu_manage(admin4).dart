import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class menu_manage extends StatefulWidget {
  @override
  _menu_manageState createState() => _menu_manageState();
}

class _menu_manageState extends State<menu_manage> {
  int liver, egg, pre_egg, pork;
  bool read = true;
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("product_price")
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          // egg = (map["ไข่ไก่"]);
          // pre_egg = (map["ไข่เยี่ยวม้า"]);
          // pork = (map["หมู"]);
          // liver = (map["ตับ"]);
          setState(() {
            egg = (map["ไข่ไก่"]);
            pre_egg = (map["ไข่เยี่ยวม้า"]);
            pork = (map["หมู"]);
            liver = (map["ตับ"]);
          });
        }
      });
    });
  }

  CollectionReference price =
      FirebaseFirestore.instance.collection("product_price");

  Future<void> update_price(int egg, int pre_egg, int pork, int liver) {
    return price
        .doc('SM9yZrPKDtjXOfCOddIp')
        .update(
            {'ไข่ไก่': egg, 'ไข่เยี่ยวม้า': pre_egg, 'หมู': pork, 'ตับ': liver})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านโจ๊กชั้น"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "จัดการเมนู",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              color: Colors.blue,
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    ' เมนู',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            TableCell(
                                child: Container(
                              color: Colors.blue,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'ราคา ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    ' หมู',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        if (pork > 0) {
                                          setState(() {
                                            pork--;
                                          });
                                        }
                                      },
                                      child: Text("-")),
                                  Text(
                                    '$pork',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        setState(() {
                                          pork++;
                                        });
                                      },
                                      child: Text("+")),
                                ],
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    ' ตับ',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        if (liver > 0) {
                                          setState(() {
                                            liver--;
                                          });
                                        }
                                      },
                                      child: Text("-")),
                                  Text(
                                    '$liver',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        setState(() {
                                          liver++;
                                        });
                                      },
                                      child: Text("+")),
                                ],
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    ' ไข่ไก่',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        if (egg > 0) {
                                          setState(() {
                                            egg--;
                                          });
                                        }
                                      },
                                      child: Text("-")),
                                  Text(
                                    '$egg',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        setState(() {
                                          egg++;
                                        });
                                      },
                                      child: Text("+")),
                                ],
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    ' ไข่เยี่ยวม้า',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        if (pre_egg > 0) {
                                          setState(() {
                                            pre_egg--;
                                          });
                                        }
                                      },
                                      child: Text("-")),
                                  Text(
                                    '$pre_egg',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  FlatButton(
                                      minWidth: 0,
                                      onPressed: () {
                                        setState(() {
                                          pre_egg++;
                                        });
                                      },
                                      child: Text("+")),
                                ],
                              ),
                            )),
                          ]),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  update_price(egg, pre_egg, pork, liver);
                  Navigator.pop(context);
                },
                child: Text("ยืนยัน",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900])),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[100],
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
