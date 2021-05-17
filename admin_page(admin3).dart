import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_project/userdata.dart';

class admin_Page extends StatefulWidget {
  @override
  _admin_Page createState() => _admin_Page();
}

class _admin_Page extends State<admin_Page> {
  bool isSwitched = false;
  String id;
  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order_limit")
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          setState(() {
            isSwitched = map["isopen"];
            id = snapshots.id;
          });
          //break;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านโจ๊กชั้น"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "เปิดรับออเดอร์",
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                      Container(
                        child: Transform.scale(
                          scale: 2.0,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) async {
                              await FirebaseFirestore.instance
                                  .collection('order_limit')
                                  .doc(id)
                                  .update({'isopen': value});
                              setState(() {
                                isSwitched = value;
                              });
                              // setState(() async {
                              //   await FirebaseFirestore.instance
                              //       .collection('order_limit')
                              //       .doc(id)
                              //       .update({'isopen': value});
                              //   isSwitched = value;
                              // });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: ElevatedButton(
                          //ปุ่ม 'จัดการเมนูร้านอาหาร'
                          onPressed: () {
                            Navigator.pushNamed(context, 'menu_page');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "จัดการเมนูร้านอาหาร",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: ElevatedButton(
                          //ปุ่ม 'ดูออเดอร์'
                          onPressed: () {
                            Navigator.pushNamed(context, 'order_view');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "ดูออเดอร์",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: ElevatedButton(
                          //ปุ่ม 'บัญชี'
                          onPressed: () {
                            Navigator.pushNamed(context, 'account_page');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[300],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "บัญชี",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    child: Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton(
                        //ปุ่ม 'การจัดการเวลา'
                        onPressed: () {
                          Navigator.pushNamed(context, 'time_page');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "การจัดการเวลา",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )),
                )),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
