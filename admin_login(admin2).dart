import "package:flutter/material.dart";

class admin_login extends StatefulWidget {
  @override
  _admin_login createState() => _admin_login();
}

class _admin_login extends State<admin_login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านโจ๊กชั้น"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.height - 200,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "เจ้าของร้าน: kimzzzz",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 70),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่าน',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                      style: TextStyle(fontSize: 20),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'กรุณาใส่รหัสผ่าน';
                        } else if (value != "0123456789") {
                          return 'รหัสผ่านไม่ถูกต้อง';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 100),
                  FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        //ปุ่ม 'ยืนยัน'
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context, 'admin_login');
                            Navigator.pushNamed(context, 'admin_page');
                          } else {
                            return null;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "ยืนยัน",
                          style:
                              TextStyle(fontSize: 30, color: Colors.deepPurple),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
