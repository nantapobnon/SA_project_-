import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class deletedata extends StatefulWidget {
  @override
  _deletedataState createState() => _deletedataState();
}

class _deletedataState extends State<deletedata> {
  List<double> time = [16.0, 16.3, 17.0, 17.3, 18.0, 18.3, 19.0, 19.3, 20.0];

  Future<Null> delete(double time) async {
    //print("order${time}");
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('order$time')
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          FirebaseFirestore.instance
              .collection('order$time')
              .doc(snapshots.id)
              .delete();
          //print("insavedata");
          //print("order");

          // print(snapshots.id);
          // print(map["url"]);
          // print("joke = ${map["joke"]}");
          // print("Sjoke = ${map["Sjoke"]}");

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ร้านโจ๊กชั้น"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ยืนยันที่จะลบข้อมูลยอดขาย",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "เเละข้อมูลออเดอร์ทั้งหมด",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                  ],
                ),
                Container(
                  width: 500,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      for (int i = 0; i < time.length; i++) {
                        await delete(time[i]);
                      }
                      await FirebaseFirestore.instance
                          .collection('store_account')
                          .doc("aTZ2eWEYbRp8dHWPEmAs")
                          .update({'Sjoke': 0});
                      await FirebaseFirestore.instance
                          .collection('store_account')
                          .doc("aTZ2eWEYbRp8dHWPEmAs")
                          .update({'Sjoke_egg': 0});
                      await FirebaseFirestore.instance
                          .collection('store_account')
                          .doc("aTZ2eWEYbRp8dHWPEmAs")
                          .update({'joke': 0});
                      await FirebaseFirestore.instance
                          .collection('store_account')
                          .doc("aTZ2eWEYbRp8dHWPEmAs")
                          .update({'joke_egg': 0});
                      await FirebaseFirestore.instance
                          .collection('store_account')
                          .doc("aTZ2eWEYbRp8dHWPEmAs")
                          .update({'total_income': 0});
                      Navigator.pop(context);
                      Navigator.pop(context, 'account_page');
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
              ],
            ),
          ),
        ));
  }
}
