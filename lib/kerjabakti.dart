import 'package:flutter/material.dart';
import 'data/constants.dart';

class KerjaBaktiPage extends StatefulWidget {
  @override
  _KerjaBaktiPageState createState() => _KerjaBaktiPageState();
}

class _KerjaBaktiPageState extends State<KerjaBaktiPage> {
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
                    'https://batiktv.pekalongankota.go.id/upload/berita/berita_20200313025012.png',
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
                        "Kerja Bakti",
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
                        "Seminggu 1 kali Pada Hari Jum'at",
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
                        "Setiap Seminggu Sekali Tepatnya Pada Hari Jumat Masyarakat Kelurahan Babakan Ciparay Rutin Melaksanakan Kerja Bakti Yang diikuti oleh para suami dilingkungan Kelurahan Babakan Ciparay.",
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
