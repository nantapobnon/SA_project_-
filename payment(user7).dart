import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa_project/userdata.dart';

class payment extends StatefulWidget {
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference user_data;
  File file;
  String alert = "";
  String url;
  order_data data;
  Future<void> ChooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker().getImage(
        source: imageSource,
        maxWidth: 800,
        maxHeight: 800,
      );

      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
  }

  Future<void> uploaddata() async {
    await user_data.add({
      "number": data.number,
      "name": data.name,
      "lname": data.lname,
      "time": data.time,
      "joke": data.joke_quan,
      "joke_egg": data.joke_egg_quan,
      "Sjoke": data.S_joke_quan,
      "Sjoke_egg": data.Sjoke_egg_quan,
      "egg": data.egg_quan,
      "pre_egg": data.pre_egg_quan,
      "pork": data.pork_quan,
      "liver": data.liver_quan,
      "sum": (data.sum * 0.5).toInt(),
      "url": data.url,
      "isfinish": data.isfinish,
      "note": data.note,
    });
  }

  Future<void> uploadimage() async {
    Random random = Random();
    int i = random.nextInt(100000);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref().child('order/$i.jpg');
    UploadTask uploadTask = reference.putFile(file);
    uploadTask.whenComplete(() async {
      url = await reference.getDownloadURL();
      data.url = url;
      uploaddata();
    }).catchError((onError) {
      //print(onError);
    });
  }

  Widget ShowQr() {
    return Container(
        width: 200,
        height: 200,
        child: Image.asset('image/metamedia-promptpay.png'));
  }

  @override
  Widget build(BuildContext context) {
    order_data inputdata = ModalRoute.of(context).settings.arguments;
    data = inputdata;
    data.isfinish = false;
    print(data.sum);
    user_data =
        FirebaseFirestore.instance.collection("order" + data.time.toString());
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
                Container(
                  child: Text(
                    "\nช่องทางชำระเงินออนไลน์",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "ธนาคารกรุงเทพ เลขที่บัญชี xxxxxxxxxxx\nธนาคารกสิกร เลขที่บัญชี xxxxxxxxxxx",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ShowQr()],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        ChooseImage(ImageSource.gallery);
                      },
                      child: Text('   แนบหลักฐานการชำระเงิน    ',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      alert,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        if (file == null) {
                          setState(() {
                            alert = "กรุณาเลือกรูปภาพ";
                          });
                        } else {
                          uploadimage();
                          //print(url);
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName('/root'));
                          Navigator.pushNamed(context, 'home_page');
                          Navigator.pushNamed(context, 'end_page',
                              arguments: data);
                        }
                      },
                      child: Text('       ยืนยัน       ',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      textColor: Colors.blueGrey[900],
                      color: Colors.deepOrangeAccent[100],
                    ),
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
