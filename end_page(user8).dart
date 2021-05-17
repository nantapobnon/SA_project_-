import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';

class end_page extends StatelessWidget {
  Widget ShowLogo() {
    return Container(
        width: 250, height: 250, child: Image.asset('image/thankyou logo.png'));
  }

  @override
  Widget build(BuildContext context) {
    order_data data = ModalRoute.of(context).settings.arguments;
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
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ขอบคุณที่ใช้บริการ',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ShowLogo()],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'order_check',
                          arguments: data);
                    },
                    child: Text('        ตรวจสอบคำสั่งซื้อ        ',
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
