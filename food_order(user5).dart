import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_project/userdata.dart';
import 'package:sa_project/user_confirmdata(user3).dart';

class food_order extends StatefulWidget {
  @override
  Page4State createState() => Page4State();
}

class Page4State extends State<food_order> {
  List quantity = [0, 0, 0, 0, 0, 0, 0, 0];
  List prize = [35, 40, 45, 50];
  int egg, pre_egg, pork, liver;
  String alert = "";
  bool check = true, isload = false;
  TextEditingController note = new TextEditingController();
  double ValueChoose = 0.0;
  int limit;
  bool isopen, isbreak = false;
  bool issettime = false;
  List<double> ListItem = [
    16.00,
    16.30,
    17.00,
    17.30,
    18.00,
    18.30,
    19.00,
    19.30,
    20.00
  ];
  List<int> order_quan = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("product_price")
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          setState(() {
            egg = (map["ไข่ไก่"]);
            pre_egg = (map["ไข่เยี่ยวม้า"]);
            pork = (map["หมู"]);
            liver = (map["ตับ"]);
          });
          //break;
        }
      });
    });
  }

  Future<Null> readtime(double time, int i) async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order$time")
          .snapshots()
          .listen((event) {
        int count = 0;
        print("time = $time");
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          //print(map["time"]);
          count++;
          //break;
        }
        // setState(() {
        //   order_quan[i] = count;
        // });
        order_quan[i] = count;
      });
    });
  }

  Future<Null> readlimit() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order_limit")
          .snapshots()
          .listen((event) {
        print("inlimit");
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          setState(() {
            limit = map["limit"];
            isopen = map["isopen"];
            //isload = true;
          });
          //break;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    callread();
    setState(() {});
  }

  void callread() async {
    await readData();
    await readlimit();
    int i = 0;

    for (i = 0; i < ListItem.length; i++) {
      await readtime(ListItem[i], i);
      //print("quan[$i] = " + order_quan[i].toString());
    }

    setState(() {
      isload = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //if (!isload) callread();
    double now = DateTime.now().hour + 0.00;
    double min = DateTime.now().minute / 100 + 0.30;
    if (min > 0.60) {
      min = 1 + min - 0.60;
    }
    now += min;
    for (int i = 0; i < ListItem.length; i++) {
      if (ListItem[i] < now) {
        ListItem.remove(ListItem[i]);
        order_quan.remove(ListItem[i--]);
      }
    }
    List<String> userdetail = ModalRoute.of(context).settings.arguments;
    if (userdetail == null || userdetail.length == 0) {
      userdetail = user_confirmdata.detail;
    }
    for (int i = 0; i < userdetail.length; i++) {
      print("userdetail[$i]");
      print(userdetail[i]);
    }

    if (isload) {
      print("limit = $limit");
      for (int j = 0; j < ListItem.length; j++) {
        print("จำนวน[$j] = " + order_quan[j].toString());
        if (order_quan[j] >= limit) {
          print("imif");
          order_quan.remove(order_quan[j]);
          ListItem.remove(ListItem[j]);
          j--;
        }
      }
      if (!issettime && ListItem.length != 0) {
        setState(() {
          ValueChoose = ListItem[0];
          issettime = true;
        });
      }

      print("liempty = ${ListItem.isEmpty}");
      if (now > 20.00 || !isopen) {
        return Scaffold(
            appBar: AppBar(
              title: Text("ร้านโจ๊กชั้น"),
            ),
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "ปิดรับออเดอร์",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700]),
                    )),
                    Center(
                        child: Text(
                      "เปิดทำการ 00:00 - 19:30",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700]),
                    )),
                  ],
                ),
              ),
            ));
      } else if (ListItem.isEmpty || ListItem.length == 0) {
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
                  "ออเดอร์เต็มเเล้ว",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700]),
                )),
              ),
            ));
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('ร้านโจ๊กชั้น'),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Column(children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'รายการอาหาร',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'โจ๊กหมูธรรมดา 35 บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[0] > 0) quantity[0]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[0].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[0]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'โจ๊กหมูธรรมดาใส่ไข่ 40 บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[1] > 0) quantity[1]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[1].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[1]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 39),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'โจ๊กหมูพิเศษ 45 บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[2] > 0) quantity[2]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[2].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[2]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'โจ๊กหมูพิเศษใส่ไข่ 50 บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[3] > 0) quantity[3]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[3].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[3]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 225),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'เพิ่มพิเศษ',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 48),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไข่ไก่ $egg บาท   ',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[4] > 0) quantity[4]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[4].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[4]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไข่เยี่ยวม้า $pre_egg บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[5] > 0) quantity[5]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[5].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[5]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'หมู $pork บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[6] > 0) quantity[6]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[6].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[6]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ตับ $liver บาท',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 15,
                                    ),
                                  ),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        if (quantity[7] > 0) quantity[7]--;
                                      });
                                    },
                                    child: Text('-'),
                                  ),
                                  Text(quantity[7].toString()),
                                  FlatButton(
                                    minWidth: 0,
                                    onPressed: () {
                                      setState(() {
                                        quantity[7]++;
                                      });
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Form(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'เพิ่มเติม'),
                                      controller: note,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'เวลาในการรับอาหาร',
                                    style: TextStyle(
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: DropdownButton(
                                value: ValueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    ValueChoose = newValue;
                                    check = false;
                                  });
                                },
                                items: ListItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem.toString() + "0"),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            alert,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          RaisedButton(
                            onPressed: () {
                              bool check = false;
                              for (int i = 0; i < quantity.length - 4; i++) {
                                if (quantity[i] > 0) {
                                  check = true;
                                  break;
                                }
                              }
                              if (check && ValueChoose != 0.0) {
                                setState(() {
                                  alert = "";
                                });
                                order_data data = new order_data();
                                data.number = userdetail[0];
                                data.name = userdetail[1];
                                data.lname = userdetail[2];
                                data.joke_quan = quantity[0];
                                data.joke_egg_quan = quantity[1];
                                data.S_joke_quan = quantity[2];
                                data.Sjoke_egg_quan = quantity[3];
                                data.egg_quan = quantity[4];
                                data.pre_egg_quan = quantity[5];
                                data.pork_quan = quantity[6];
                                data.liver_quan = quantity[7];
                                data.time = ValueChoose;
                                data.egg_price = egg;
                                data.pre_egg_price = pre_egg;
                                data.pork_price = pork;
                                data.liver_price = liver;
                                data.note += note.text;
                                Navigator.pushNamed(context, 'order_confirm',
                                    arguments: data);
                              } else if (ValueChoose == 0.0) {
                                setState(() {
                                  alert = "ขออภัยร้านปิดเเล้ว";
                                });
                              } else {
                                setState(() {
                                  alert = "กรุณาเลือกอาหาร";
                                });
                              }
                            },
                            child: Text('               ยืนยัน               ',
                                style: TextStyle(fontSize: 20)),
                            textColor: Colors.indigo[900],
                            color: Colors.pink[100],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
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
              "กำลังโหลด...",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700]),
            )),
          ),
        ));
  }
}
