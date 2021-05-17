import 'package:flutter/material.dart';

class confirm_order extends StatefulWidget {
  @override
  _confirm_orderState createState() => _confirm_orderState();
}

class _confirm_orderState extends State<confirm_order> {
  String ValueChoose;
  List ListItem = [
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านโจ๊กชั้น'),
      ),
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'รายการอาหาร',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'โจ๊กหมูธรรมดา 35 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'โจ๊กหมูธรรมดาใส่ไข่ 40 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 39),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'โจ๊กหมูพิเศษ 45 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'โจ๊กหมูพิเศษใส่ไข่ 50 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 225),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'เพิ่มพิเศษ',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ไข่ไก่ 7 บาท   ',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ไข่เยี่ยวม้า 15 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'หมู 20 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ตับ 20 บาท',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                  ),
                ),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('-'),
                ),
                Text('0'),
                FlatButton(
                  minWidth: 0,
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'เวลาในการรับอาหาร',
                  style: TextStyle(
                    fontFamily: 'SukhumvitSet',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: DropdownButton(
              value: ValueChoose,
              onChanged: (newValue) {
                setState(() {
                  ValueChoose = newValue;
                });
              },
              items: ListItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
