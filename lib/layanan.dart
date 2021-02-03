import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'data/constants.dart';
import 'item/bottomnav.dart';

class LayananPage extends StatefulWidget {
  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  var layanan = "";
  User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1,
      ),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            child: new Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage('lib/images/layanan1.jpg'),
                AssetImage('lib/images/layanan2.jpg'),
                AssetImage('lib/images/layanan3.jpg'),
                AssetImage('lib/images/layanan4.jpg'),
              ],
              autoplay: true,
              animationCurve: Curves.fastLinearToSlowEaseIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 4.0,
              indicatorBgPadding: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Layanan",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildActivityButton(Icons.request_page_outlined, "Pembuatan KTP",
                  Color(0XFF69F0AE).withOpacity(0.4), Color(0XFF01579B)),
              buildActivityButton(Icons.request_page_outlined, "Pembuatan KK",
                  Color(0XFF69F0AE).withOpacity(0.4), Color(0XFF01579B)),
              buildActivityButton(
                  Icons.request_page_outlined,
                  "Pembuatan Akta Tanah",
                  Color(0XFF69F0AE).withOpacity(0.4),
                  Color(0XFF01579B)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildActivityButton(
                  Icons.request_page_outlined,
                  "Surat Keterangan Menikah",
                  Color(0XFF69F0AE).withOpacity(0.4),
                  Color(0XFF01579B)),
              buildActivityButton(
                  Icons.request_page_outlined,
                  "Surat Keterangan Belum Menikah",
                  Color(0XFF69F0AE).withOpacity(0.4),
                  Color(0XFF01579B)),
              buildActivityButton(
                  Icons.request_page_outlined,
                  "Surat Keterangan SKTM",
                  Color(0XFF69F0AE).withOpacity(0.4),
                  Color(0XFF01579B)),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text("Permintaan layanan"),
              content:
                  Text("Anda akan mengirimkan perminataan pembuatan $title"),
              actions: [
                CupertinoDialogAction(
                  child: Text('tidak'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text('ya'),
                  onPressed: () async {
                    await Fireservice.addLayanan(user.uid, title);
                    //close dialog
                    Navigator.pop(context);
                    //close page
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
