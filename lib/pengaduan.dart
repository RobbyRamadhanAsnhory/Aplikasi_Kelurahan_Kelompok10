import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/Login.dart';
import 'data/constants.dart';
import 'item/drawer.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({Key key}) : super(key: key);
  static const routeName = '/Home';
  @override
  _PengaduanPageState createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pengaduan'),
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            color: Color(0XFF00B686),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildExpenseBotton(Icons.phone, "Telepon", false),
                    buildExpenseBotton(Icons.photo_camera, "Bukti", false),
                    buildExpenseBotton(Icons.card_membership, "Card", false),
                    buildExpenseBotton(Icons.ev_station, "Lainnya", false),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Call Center Pengaduan:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            height: MediaQuery.of(context).size.height - 230,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildRecentContact("Pak Lurah",
                                "http://sendangguwo.semarangkota.go.id/templates/default/images/paklurah2.jpeg"),
                            buildRecentContact("Sekretaris",
                                "https://cdn-2.tstatic.net/palu/foto/bank/images/sekretaris-kelurahan-lere-indo-aperahman.jpg"),
                            buildRecentContact("Staff Keuangan",
                                "https://1.bp.blogspot.com/-CCGXBrN7Bss/XipyOGp8bAI/AAAAAAAAFZ8/cTzH4jzXWlIKnbYb9BEFoWzq0oxloZiDwCLcBGAsYHQ/s640/IMG_20200124_111358.jpg"),
                            buildRecentContact("Staff Umum",
                                "https://jambione.com/foto_berita/2020/08/25/6617maulana.jpg"),
                            buildRecentContact("Bu lurah",
                                "https://beritatransparansi.files.wordpress.com/2017/01/img-20170110-wa00141.jpg"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Riwayat",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,
                                  size: 30, color: Colors.grey),
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        buildContactRow("Pak Lurah", "+62836254122",
                            "http://sendangguwo.semarangkota.go.id/templates/default/images/paklurah2.jpeg"),
                        buildContactRow("Bu lurah", "+68152354216",
                            "https://cdn-2.tstatic.net/palu/foto/bank/images/sekretaris-kelurahan-lere-indo-aperahman.jpg"),
                        buildContactRow("Staff", "+628532261738",
                            "https://1.bp.blogspot.com/-CCGXBrN7Bss/XipyOGp8bAI/AAAAAAAAFZ8/cTzH4jzXWlIKnbYb9BEFoWzq0oxloZiDwCLcBGAsYHQ/s640/IMG_20200124_111358.jpg"),
                        buildContactRow("Pak RT", "+628543346788",
                            "https://cdn-2.tstatic.net/style/foto/bank/images/aktor-arya-saloka.jpg"),
                        buildContactRow("Pak RW", "+628998464632",
                            "https://media.bolatimes.com/thumbs/2020/06/29/76437-billy-syahputra-suaracomevi/730x480-img-76437-billy-syahputra-suaracomevi.jpg"),
                        buildContactRow("Tetangga", "+62813374753",
                            "https://riaupos.co/thumb/1898-amanda.jpg"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContactRow(String name, String phone, String url) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey[200]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        phone,
                        style: (TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container buildRecentContact(String name, String url) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Container buildExpenseBotton(IconData icon, String title, bool isActive) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Color(0XFF00B686) : Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive ? Color(0XFF00B686) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
