import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';

class InfoDesaPage extends StatefulWidget {
  @override
  _InfoDesaPageState createState() => _InfoDesaPageState();
}

class _InfoDesaPageState extends State<InfoDesaPage> {
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
                child: new Carousel(
                  boxFit: BoxFit.cover,
                  images: [
                    AssetImage('lib/images/info1.jpg'),
                    AssetImage('lib/images/info2.jpg'),
                    AssetImage('lib/images/info3.jpg'),
                    AssetImage('lib/images/info4.jpg'),
                  ],
                  autoplay: true,
                  animationCurve: Curves.fastLinearToSlowEaseIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 4.0,
                  indicatorBgPadding: 2.0,
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
                        "Info Desa",
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
                        "+(022) 6672934",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Jl.Babakan Ciparay No.121",
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
                        "Sejarah :",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Kantor Kecamatan Babakan Ciparay direnovasi sejak tanggal 14 Mei 2018 dan selesai tepat waktu pada 9 November 2018. Renovasi kantor yang berdiri di atas lahan seluas 1.138 m2 ini, menghabiskan dana sekitar Rp5,4 miliar.",
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
