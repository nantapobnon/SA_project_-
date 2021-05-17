import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sa_project/account(admin6).dart';
import 'package:sa_project/admin_login(admin2).dart';
import 'package:sa_project/admin_page(admin3).dart';
import 'package:sa_project/deletedata(admin).dart';
import 'package:sa_project/end_page(user8).dart';
import 'package:sa_project/food_order(user5).dart';
import 'package:sa_project/limitchange.dart';
import 'package:sa_project/menu_manage(admin4).dart';
import 'package:sa_project/order_check(user9).dart';
import 'package:sa_project/order_confirm(user6).dart';
import 'package:sa_project/order_list(admin8).dart';
import 'package:sa_project/order_view(admin5).dart';
import 'package:sa_project/payment(user7).dart';
import 'package:sa_project/register_success(user4).dart';
import 'package:sa_project/time_manage(admin7).dart';
import 'package:sa_project/user_confirmdata(user3).dart';
import 'package:sa_project/user_login(user2).dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa_project/userdata.dart';
import 'package:sa_project/limitchange.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[200],
        fontFamily: 'sukhumvit',
      ),
      title: "ร้านโจ๊กชั้น",
      home: homepage(),
      routes: {
        'home_page': (context) => homepage(),
        'account_page': (context) => Account(),
        'time_page': (context) => time_Manage(),
        'order_list': (context) => Order_list(),
        'order_view': (context) => Order_view(),
        'menu_page': (context) => menu_manage(),
        'admin_login': (context) => admin_login(),
        'admin_page': (context) => admin_Page(),
        'user_login': (context) => user_login(),
        'user_confirmdata': (context) => user_confirmdata(),
        'register_success': (context) => register_success(),
        'food_order': (context) => food_order(),
        'order_confirm': (context) => order_confirm(),
        'payment_page': (context) => payment(),
        'end_page': (context) => end_page(),
        'order_check': (context) => order_check(),
        'limitchange': (context) => limitchange(),
        'deletedata': (context) => deletedata(),
      },
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  order_data data = new order_data();
  List<String> userdetail = new List<String>();
  TextEditingController number = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> mylist = [];

  bool check = false;

  bool isNumeric(String s) {
    bool check = false;
    String a = "0123456789";
    print(s);
    for (int i = 0; i < s.length; i++) {
      if (s[i] != '0' &&
          s[i] != '1' &&
          s[i] != '2' &&
          s[i] != '3' &&
          s[i] != '4' &&
          s[i] != '5' &&
          s[i] != '6' &&
          s[i] != '7' &&
          s[i] != '8' &&
          s[i] != '9') {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านโจ๊กชั้น"),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยินดีต้อนรับ',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'เบอร์มือถือ: ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty ||
                                value.length != 10 ||
                                value[0] != "0" ||
                                isNumeric(number.text)) {
                              return 'กรุณาใส่เบอร์โทรศัพท์ให้ถูกต้อง';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      print(number.text);
                      print(isNumeric(number.text));
                      check = false;
                      if (_formKey.currentState.validate()) {
                        //print("sawasdee");
                        Future<Null> readData() async {
                          await Firebase.initializeApp().then((value) async {
                            await FirebaseFirestore.instance
                                .collection("user data")
                                .snapshots()
                                .listen((event) {
                              for (var snapshots in event.docs) {
                                Map<String, dynamic> map = snapshots.data();
                                //print(map["number"]);
                                if (map["number"] == number.text) {
                                  check = true;
                                  mylist.add(map["number"]);
                                  mylist.add(map["name"]);
                                  mylist.add(map["lname"]);
                                  break;
                                }
                              }
                              if (number.text == "0123456789") {
                                Navigator.pushNamed(context, 'admin_login');
                                number.clear();
                              } else if (check) {
                                Navigator.pushNamed(context, 'food_order',
                                    arguments: mylist);
                                number.clear();
                              } else {
                                userdetail.clear();
                                userdetail.add(number.text);
                                Navigator.pushNamed(context, 'user_login',
                                    arguments: userdetail);
                                number.clear();
                              }
                            });
                          });
                        }

                        readData();
                      } else {
                        return null;
                      }
                    },
                    child: Text('               ถัดไป               ',
                        style: TextStyle(fontSize: 20)),
                    textColor: Colors.indigo[900],
                    color: Colors.pink[100],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        data.number = number.text;
                        Navigator.pushNamed(context, 'order_check',
                            arguments: data);
                      } else {
                        return null;
                      }
                    },
                    child: Text('    ตรวจสอบคำสั่งซื้อ    ',
                        style: TextStyle(fontSize: 20)),
                    textColor: Colors.blueGrey[900],
                    color: Colors.deepOrangeAccent[100],
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
