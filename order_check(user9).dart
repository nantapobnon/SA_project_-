import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class order_check extends StatefulWidget {
  @override
  _order_checkState createState() => _order_checkState();
}

class _order_checkState extends State<order_check> {
  List<int> quan = [0, 0, 0, 0, 0, 0, 0, 0];
  List ListItem = [16.0, 16.3, 17.0, 17.3, 18.0, 18.3, 19.0, 19.3, 20.0];
  List<Widget> wid = [];
  bool check = false;
  double time;
  order_data data;
  Widget ShowLogo1() {
    return Container(
        width: 120, height: 120, child: Image.asset('image/chef.png'));
  }

  void createwidget(List<int> quan, double width) {
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
        wid.add(Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    product_name[i],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "   " + quan[i].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
      }
    }
  }

  Future<Null> readData(double time) async {
    //print("order${time}");
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("order${time}")
          .snapshots()
          .listen((event) {
        if (!check) {
          for (var snapshots in event.docs) {
            Map<String, dynamic> map = snapshots.data();
            //print("order");
            if (map["number"] == data.number) {
              quan[0] = map["joke"];
              quan[1] = map["joke_egg"];
              quan[2] = map["Sjoke"];
              quan[3] = map["Sjoke_egg"];
              quan[4] = map["egg"];
              quan[5] = map["pre_egg"];
              quan[6] = map["pork"];
              quan[7] = map["liver"];
              data.isfinish = map["isfinish"];
              data.sum = map["sum"];
              //print("snapshot id = " + snapshots.id);
              setState(() {
                check = true;
              });
              break;
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    order_data indata = ModalRoute.of(context).settings.arguments;
    data = indata;
    // print("sawasdee " + data.number);
    // print(data.name);
    if (data.name == "") {
      // if (!check) {
      //   for (int i = 0; i < ListItem.length; i++) {
      //     if (check) break;
      //     readData(ListItem[i]);
      //   }
      // }
      for (int i = 0; i < ListItem.length && !check; i++) {
        readData(ListItem[i]);
      }
      String text = "";
      if (check) {
        (data.isfinish)
            ? text = "อาหารเสร็จเเล้ว"
            : text = "เรากำลังเตรียมอาหารของท่าน";
        createwidget(quan, MediaQuery.of(context).size.width);
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
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'สถานะการสั่งซื้อ',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ListView(shrinkWrap: true, children: wid),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 185),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'รวมทั้งสิ้น ${data.sum} บาท',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ShowLogo1()],
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName('/root'));
                          Navigator.pushNamed(context, 'home_page');
                        },
                        child: Text('               ตกลง               ',
                            style: TextStyle(fontSize: 20)),
                        textColor: Colors.indigo[900],
                        color: Colors.pink[100],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
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
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'สถานะการสั่งซื้อ',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ไม่พบคำสั่งซื้อของคุณ",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ShowLogo1()],
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName('/root'));
                          Navigator.pushNamed(context, 'home_page');
                        },
                        child: Text('               ตกลง               ',
                            style: TextStyle(fontSize: 20)),
                        textColor: Colors.indigo[900],
                        color: Colors.pink[100],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    } else {
      print("inelse");
      quan[0] = data.joke_quan;
      quan[1] = data.joke_egg_quan;
      quan[2] = data.S_joke_quan;
      quan[3] = data.Sjoke_egg_quan;
      quan[4] = data.egg_quan;
      quan[5] = data.pre_egg_quan;
      quan[6] = data.pork_quan;
      quan[7] = data.liver_quan;

      createwidget(quan, MediaQuery.of(context).size.width);
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
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'สถานะการสั่งซื้อ',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListView(shrinkWrap: true, children: wid),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 185),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'รวมทั้งสิ้น ${(data.sum / 2).toInt()} บาท',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'เรากำลังเตรียมอาหารของท่าน...',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ShowLogo1()],
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName('/root'));
                        Navigator.pushNamed(context, 'home_page');
                      },
                      child: Text('               ตกลง               ',
                          style: TextStyle(fontSize: 20)),
                      textColor: Colors.indigo[900],
                      color: Colors.pink[100],
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
}
