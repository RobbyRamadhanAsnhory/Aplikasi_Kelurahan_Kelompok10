import 'package:flutter/material.dart';
import 'data/constants.dart';

class AcaraAgustusPage extends StatefulWidget {
  @override
  _AcaraAgustusPageState createState() => _AcaraAgustusPageState();
}

class _AcaraAgustusPageState extends State<AcaraAgustusPage> {
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
                    'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1504173905/IMG-20170827-WA0001_eygiut.jpg',
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
                        "Acara 17 Agustus",
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
                        "Rutin Setiap Tahun Pada Hari Kemerdekaan",
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
                        "Pada Bulan Agustus Tepat Pada Tanggal 17 Agustus Kelurahan Babakan Ciparay Rutin Melaksanakan Kegiatan 17 Agustus Setiap Tahunnya Dengan Ikuti 9 Rw Didalammnya.",
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
