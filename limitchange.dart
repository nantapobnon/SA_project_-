import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_project/userdata.dart';

class limitchange extends StatefulWidget {
  @override
  _limitchangeState createState() => _limitchangeState();
}

class _limitchangeState extends State<limitchange> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController limit = new TextEditingController();

  bool isNumeric(String s) {
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
    int orderlimit = ModalRoute.of(context).settings.arguments;
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
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'เปลี่ยนจำนวนออเดอร์จำกัดในเเต่ละรอบ: ',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: limit,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == "0" ||
                                value.isEmpty ||
                                isNumeric(limit.text)) {
                              return 'ออเดอร์จำกัดต้องไม่เท่ากับ 0';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        await FirebaseFirestore.instance
                            .collection('order_limit')
                            .doc("a9IrmFCV4nBMMXxYLQSZ")
                            .update({'limit': int.parse(limit.text)});

                        Navigator.pop(context, 'limitchange');
                        Navigator.pop(context, 'time_page');
                        Navigator.pushNamed(
                          context,
                          'time_page',
                        );
                      } else {
                        return null;
                      }
                    },
                    child: Text('    ตกลง    ', style: TextStyle(fontSize: 20)),
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
