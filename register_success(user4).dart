import 'package:flutter/material.dart';

class register_success extends StatefulWidget {
  @override
  Page3State createState() => Page3State();
}

class Page3State extends State<register_success> {
// This widget is the root of your application.

  Widget ShowIcon() {
    return Container(
        width: 100, height: 100, child: Image.asset('image/clipart534583.png'));
  }

  @override
  Widget build(BuildContext context) {
    List<String> userdetail = ModalRoute.of(context).settings.arguments;
    for (int i = 0; i < userdetail.length; i++) {
      print("userdetail[$i]");
      print(userdetail[i]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านโจ๊กชั้น'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(children: [
              SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'สมัครเสร็จสิ้น',
                      style: TextStyle(
                        fontFamily: 'SukhumvitSet',
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
                  children: [ShowIcon()],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'food_order',
                    //     arguments: userdetail);
                    Navigator.pop(context);
                  },
                  child: Text('               สั่งอาหาร               ',
                      style: TextStyle(fontSize: 20)),
                  textColor: Colors.indigo[900],
                  color: Colors.pink[100],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
