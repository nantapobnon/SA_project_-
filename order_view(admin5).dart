import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order_view extends StatefulWidget {
  @override
  _Order_viewState createState() => _Order_viewState();
}

class _Order_viewState extends State<Order_view> {
  List<Widget> wid = [];
  List ListItem = [16.0, 16.3, 17.0, 17.3, 18.0, 18.3, 19.0, 19.3, 20.0];
  List<int> quan = [0, 0, 0, 0, 0, 0, 0, 0];
  int joke, joke_egg, Sjoke, Sjoke_egg, total_income;
  bool check = false;
  int sum;
  double time;
  String id, note = "", number, name, url;

  void createwidget(List<int> quan) {
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
    for (int i = 0; i < quan.length; i++) {
      if (quan[i] != 0) {
        wid.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product_name[i],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "     " + quan[i].toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<Null> readData(double t) async {
    //print("order${time}");
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order${t}")
          .snapshots()
          .listen((event) {
        if (!check) {
          for (var snapshots in event.docs) {
            Map<String, dynamic> map = snapshots.data();
            //print("order");
            if (!map["isfinish"]) {
              print(snapshots.id);
              print(map["url"]);
              print("joke = ${map["joke"]}");
              print("Sjoke = ${map["Sjoke"]}");

              quan[0] = map["joke"];

              quan[1] = map["joke_egg"];

              quan[2] = map["Sjoke"];
              print("quan[2] = ${quan[2]}");
              quan[3] = map["Sjoke_egg"];
              quan[4] = map["egg"];
              quan[5] = map["pre_egg"];
              quan[6] = map["pork"];
              quan[7] = map["liver"];
              number = map["number"];
              if (map["note"] != null) {
                note += map["note"];
              }
              print("name = ${map["name"]}");
              name = map["name"];
              time = map["time"];
              url = map["url"];
              print("time = " + time.toString());
              sum = map["sum"];

              setState(() {
                check = true;
                id = snapshots.id;
              });
              break;
            }
          }
        }

        Future<Null> saveData() async {
          //print("order${time}");
          await Firebase.initializeApp().then((value) async {
            await FirebaseFirestore.instance
                .collection("store_account")
                .snapshots()
                .listen((event) {
              print("insavedata");
              for (var snapshots in event.docs) {
                Map<String, dynamic> map = snapshots.data();
                //print("insavedata");
                //print("order");

                // print(snapshots.id);
                // print(map["url"]);
                // print("joke = ${map["joke"]}");
                // print("Sjoke = ${map["Sjoke"]}");
                joke = map["joke"];
                joke_egg = map["joke_egg"];
                Sjoke = map["Sjoke"];
                Sjoke_egg = map["Sjoke_egg"];
                total_income = map["total_income"];

                return;
              }
            });
          });
        }

        if (check) saveData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!check) {
      for (int i = 0; i < ListItem.length && !check; i++) {
        readData(ListItem[i]);
      }
    }
    createwidget(quan);
    if (check) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ร้านโจ๊กชั้น"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                        height: 300,
                        margin: EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "คุณ : $name",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "เบอร์ : $number",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(""),
                                Column(
                                  children: wid,
                                ),

                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "โจ๊กหมูธรรมดา",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Text(
                                //       "10",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "+ หมู",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Text(
                                //       "1",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      note,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "รวมทั้งสิ้น $sum บาท",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "เวลาในการรับอาหาร " +
                                          time.toString() +
                                          "0 น.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 300,
                                  child: Center(
                                    child: Image.network(url),
                                    //     Image.asset(
                                    //   'image/slipSA.png',
                                    //   height: 600,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pop(context);

                          //saveData(quan,sum);

                          FirebaseFirestore.instance
                              .collection('order$time')
                              .doc(id)
                              .update({'isfinish': true});
                          FirebaseFirestore.instance
                              .collection('store_account')
                              .doc('aTZ2eWEYbRp8dHWPEmAs')
                              .update({'joke': joke + quan[0]});
                          FirebaseFirestore.instance
                              .collection('store_account')
                              .doc('aTZ2eWEYbRp8dHWPEmAs')
                              .update({'joke_egg': joke_egg + quan[1]});
                          FirebaseFirestore.instance
                              .collection('store_account')
                              .doc('aTZ2eWEYbRp8dHWPEmAs')
                              .update({'Sjoke': Sjoke + quan[2]});
                          FirebaseFirestore.instance
                              .collection('store_account')
                              .doc('aTZ2eWEYbRp8dHWPEmAs')
                              .update({'Sjoke_egg': Sjoke_egg + quan[3]});
                          FirebaseFirestore.instance
                              .collection('store_account')
                              .doc('aTZ2eWEYbRp8dHWPEmAs')
                              .update({'total_income': total_income + sum});
                          // setState(() {
                          //   check = false;
                          // });
                          //
                          //saveData(quan, sum, check);
                          Navigator.pop(context);
                          Navigator.pushNamed(context, 'order_view');
                        },
                        child: Text("เสร็จเเล้ว",
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('order$time')
                              .doc(id)
                              .delete();
                          Navigator.pop(context);
                          Navigator.pushNamed(context, 'order_view');
                        },
                        child: Text("ทิ้ง",
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
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("ร้านโจ๊กชั้น"),
          ),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width - 50,
              child: Center(
                  child: Text(
                "ยังไม่มีออเดอร์",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700]),
              )),
            ),
          ));
    }
  }
}
