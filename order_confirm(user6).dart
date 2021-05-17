import 'package:flutter/material.dart';
import 'package:sa_project/userdata.dart';

class order_confirm extends StatelessWidget {
  // This widget is the root of your application.

  String food;
  List<int> prize = [35, 40, 45, 50, 0, 0, 0, 0];
  List<int> quan = [0, 0, 0, 0, 0, 0, 0, 0];
  List<Widget> wid = [];
  int sum = 0;
  void createwidget(List<int> prize, List<int> quan, double width) {
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
                    product_name[i] + ' ' + prize[i].toString() + " บาท      ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    quan[i].toString(),
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

  @override
  Widget build(BuildContext context) {
    order_data data = ModalRoute.of(context).settings.arguments;
    quan[0] = data.joke_quan;
    quan[1] = data.joke_egg_quan;
    quan[2] = data.S_joke_quan;
    quan[3] = data.Sjoke_egg_quan;
    quan[4] = data.egg_quan;
    quan[5] = data.pre_egg_quan;
    quan[6] = data.pork_quan;
    quan[7] = data.liver_quan;
    prize[4] = data.egg_price;
    prize[5] = data.pre_egg_price;
    prize[6] = data.pork_price;
    prize[7] = data.liver_price;
    createwidget(prize, quan, MediaQuery.of(context).size.width);
    for (int i = 0; i < quan.length; i++) {
      if (quan[i] != 0) sum += prize[i] * quan[i];
    }
    data.sum = sum;
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านโจ๊กชั้น'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ยืนยันคำสั่งซื้อ',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView(shrinkWrap: true, children: wid),
              Container(
                padding: const EdgeInsets.only(right: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.note,
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
                padding: const EdgeInsets.only(right: 185),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'รวมทั้งสิ้น ' + sum.toString() + " บาท",
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
                padding: const EdgeInsets.only(right: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'เวลาในการรับอาหาร ' + data.time.toString() + '0 น.',
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
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'payment_page',
                        arguments: data);
                  },
                  child: Text('         ยืนยันคำสั่งซื้อ         ',
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
                  child: Text('                  แก้ไข                  ',
                      style: TextStyle(fontSize: 20)),
                  textColor: Colors.blueGrey[900],
                  color: Colors.blueAccent[100],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
