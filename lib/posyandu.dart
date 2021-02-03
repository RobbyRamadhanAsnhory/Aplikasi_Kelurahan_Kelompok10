import 'package:flutter/material.dart';
import 'data/constants.dart';

class PosyanduPage extends StatefulWidget {
  @override
  _PosyanduPageState createState() => _PosyanduPageState();
}

class _PosyanduPageState extends State<PosyanduPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200.0,
                child: Ink.image(
                  image: NetworkImage(
                    'https://tribratanews.polresjember.id/wp-content/uploads/2020/06/IMG-20200604-WA0410-1024x768.jpg',
                  ),
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: 190,
            height: MediaQuery.of(context).size.height - 230,
            child: Column(
              children: [
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Posyandu",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Kelurahan Babakan Ciparay",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dilaksanakan :",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "6 Bulan Sekali",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Deskripsi :",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Diharapkan Kepada Para Orang tua Yang Memiliki Anak Balita Supaya Dapat Meningkatkan Kesadaran Untuk aktif Menjaga Kestabilan Kesehatan Buah Hati Dengan Membawanya Keposyandu Secara Berkala yaitu 6 Bulan Sekali",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
