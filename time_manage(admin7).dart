import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_project/userdata.dart';

class time_Manage extends StatefulWidget {
  @override
  _time_ManageState createState() => _time_ManageState();
}

class _time_ManageState extends State<time_Manage> {
  double w = 100;
  double h = 50;
  int orderlimit;
  List<String> a = new List(2);
  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order_limit")
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          setState(() {
            orderlimit = map["limit"];
          });
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
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "การจัดการเวลา",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "จำนวนจำกัดในเเต่ละรอบ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'limitchange',
                              arguments: orderlimit);
                        },
                        child: Text(orderlimit.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Colors.indigo[900])),
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
              Container(
                margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "16.0";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("16.00",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "16.3";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("16.30",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "17.0";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("17.00",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "17.3";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("17.30",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "18.0";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("18.00",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Container(
                            width: w,
                            height: h,
                            child: ElevatedButton(
                              onPressed: () {
                                a[0] = orderlimit.toString();
                                a[1] = "18.3";
                                Navigator.pushNamed(context, 'order_list',
                                    arguments: a);
                              },
                              child: Text("18.30",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo[900])),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w,
                          height: h,
                          child: ElevatedButton(
                            onPressed: () {
                              a[0] = orderlimit.toString();
                              a[1] = "19.0";
                              Navigator.pushNamed(context, 'order_list',
                                  arguments: a);
                            },
                            child: Text("19.00",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.indigo[900])),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: w,
                          height: h,
                          child: ElevatedButton(
                            onPressed: () {
                              a[0] = orderlimit.toString();
                              a[1] = "19.3";
                              Navigator.pushNamed(context, 'order_list',
                                  arguments: a);
                            },
                            child: Text("19.30",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.indigo[900])),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: w,
                          height: h,
                          child: ElevatedButton(
                            onPressed: () {
                              a[0] = orderlimit.toString();
                              a[1] = "20.0";
                              Navigator.pushNamed(context, 'order_list',
                                  arguments: a);
                            },
                            child: Text("20.00",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.indigo[900])),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('order_limit')
                        .doc("a9IrmFCV4nBMMXxYLQSZ")
                        .update({'isopen': false});
                    Navigator.pop(context);
                    Navigator.pop(context, 'admin_page');
                    Navigator.pushNamed(
                      context,
                      'admin_page',
                    );
                  },
                  child: Text("ปิดรอบ",
                      style:
                          TextStyle(fontSize: 25, color: Colors.indigo[900])),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
