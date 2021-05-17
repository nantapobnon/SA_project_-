import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class user_confirmdata extends StatelessWidget {
  static List<String> detail;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference user_data =
      FirebaseFirestore.instance.collection("user data");
  @override
  Widget build(BuildContext context) {
    List<String> userdetail = ModalRoute.of(context).settings.arguments;
    detail = userdetail;
    for (int i = 0; i < userdetail.length; i++) {
      print("userdetail[$i]");
      print(userdetail[i]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านโจ๊กชั้น'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ตรวจสอบข้อมูลส่วนตัว',
                      style: TextStyle(
                        fontFamily: 'SukhumvitSet',
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ชื่อ: ' + userdetail[1],
                      style: TextStyle(
                        fontFamily: 'SukhumvitSet',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'นามสกุล: ' + userdetail[2],
                      style: TextStyle(
                        fontFamily: 'SukhumvitSet',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'เบอร์โทรศัพท์: ' + userdetail[0],
                      style: TextStyle(
                        fontFamily: 'SukhumvitSet',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () async {
                    await user_data.add({
                      "number": userdetail[0],
                      "name": userdetail[1],
                      "lname": userdetail[2]
                    });
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName('/root'));
                    Navigator.pushNamed(context, 'home_page');
                    Navigator.pushNamed(context, 'register_success',
                        arguments: userdetail);
                  },
                  child: Text('               ยืนยัน               ',
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
                    Navigator.pop(context);
                  },
                  child: Text('                แก้ไข                ',
                      style: TextStyle(fontSize: 20)),
                  textColor: Colors.blueGrey[900],
                  color: Colors.blueAccent[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
