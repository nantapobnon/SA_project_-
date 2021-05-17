import 'package:flutter/material.dart';

class user_login extends StatefulWidget {
  @override
  _user_loginState createState() => _user_loginState();
}

class _user_loginState extends State<user_login> {
  @override
  Widget build(BuildContext context) {
    List<String> userdetail = ModalRoute.of(context).settings.arguments;
    TextEditingController name = new TextEditingController();
    TextEditingController surname = new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านโจ๊กชั้น'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'กรอกข้อมูลส่วนตัว',
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
                        'ชื่อ: ',
                        style:
                            TextStyle(fontFamily: 'SukhumvitSet', fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: name,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'กรุณาใส่ชื่อ';
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'นามสกุล: ',
                        style:
                            TextStyle(fontFamily: 'SukhumvitSet', fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: surname,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'กรุณาใส่นามสกุล';
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        String num = userdetail[0];
                        userdetail.clear();
                        userdetail.add(num);
                        userdetail.add(name.text);
                        userdetail.add(surname.text);
                        Navigator.pushNamed(context, 'user_confirmdata',
                            arguments: userdetail);
                        print(userdetail[0]);
                        //print("pass");
                      } else {
                        return null;
                      }
                    },
                    child: Text('               ยืนยัน               ',
                        style: TextStyle(fontSize: 20)),
                    textColor: Colors.indigo[900],
                    color: Colors.pink[100],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
