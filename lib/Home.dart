import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/biodata.dart';
import 'package:uas_kelurahan_kelompok10/item/bottomnav.dart';
import 'package:uas_kelurahan_kelompok10/layanan.dart';
import 'package:uas_kelurahan_kelompok10/pengaduan.dart';
import 'package:uas_kelurahan_kelompok10/riwayat.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'Login.dart';
import 'data/constants.dart';
import 'item/drawer.dart';
import 'pengaduan.dart';
import 'data/user.dart';

class PageHome extends StatefulWidget {
  final String nama;
  final String password;

  static const routeName = '/Home';
  //constructor

  const PageHome({Key key, @required this.nama, @required this.password})
      : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  UserApp userApp;
  var nUsername;
  User user;
  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    if (user == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelurahanku'),
        backgroundColor: ColorPalette.primaryColor,
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              FutureBuilder<DocumentSnapshot>(
                  future: Fireservice.getdataUser(user.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0XFF00B686), Color(0XFF00838F)]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF00B686),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 8,
                                          spreadRadius: 3)
                                    ],
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: snapshot.data.data()["profile"] != ""
                                      ? Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data.data()["profile"],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: 70,
                                          color: Colors.grey[400],
                                        ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        snapshot.data.data()["nama"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "\NIK",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        " ${snapshot.data.data()["nik"]}",
                                                    style: TextStyle(
                                                        color: Colors.white38))
                                              ]),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.grey.shade100,
                  child: ListView(
                    padding: EdgeInsets.only(top: 55),
                    children: [
                      Text(
                        "Activity",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildActivityBiodata(Icons.card_membership, "Biodata",
                              Colors.blue.withOpacity(0.4), Color(0XFF01579B)),
                          buildActivityButtonRiwayat(
                              Icons.transfer_within_a_station,
                              "Riwayat",
                              Colors.cyanAccent.withOpacity(0.4),
                              Color(0XFF0097A7)),
                          buildActivityButton(
                              Icons.pie_chart,
                              "Info Desa",
                              Color(0XFFD7CCC8).withOpacity(0.4),
                              Color(0XFF9499B7)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildActivityButton(
                              Icons.request_page_outlined,
                              "Pajak",
                              Color(0XFF69F0AE).withOpacity(0.4),
                              Color(0XFF01579B)),
                          buildActivityButtonLayanan(
                              Icons.receipt_long_outlined,
                              "Layanan",
                              Color(0XFF90CAF9).withOpacity(0.4),
                              Color(0XFF0097A7)),
                          buildActivityPengaduan(
                              Icons.rate_review_outlined,
                              "Pengaduan",
                              Color(0XFFE1BEE7).withOpacity(0.4),
                              Color(0XFF9499B7)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Kategori",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildCategoryCard(
                          Icons.contact_page_outlined, "Penduduk", 109765, 100),
                      buildCategoryCard(
                          Icons.attribution_rounded, "Laki-Laki", 55084, 52),
                      buildCategoryCard(
                          Icons.attribution_sharp, "Perempuan", 54681, 48),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 120,
            right: 0,
            child: FutureBuilder<DocumentSnapshot>(
                future: Fireservice.getdataUser(user.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 8,
                            spreadRadius: 3,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(50),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Pendapatan",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Color(0XFF00838F),
                                    )
                                  ],
                                ),
                                Text(
                                  snapshot.data.data()["pendapatan"] == ""
                                      ? "Rp. 0"
                                      : snapshot.data.data()["pendapatan"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                            Container(width: 1, height: 50, color: Colors.grey),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Pengeluaran",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_downward,
                                      color: Color(0XFF00838F),
                                    )
                                  ],
                                ),
                                Text(
                                  snapshot.data.data()["pengeluaran"] == ""
                                      ? "Rp. 0"
                                      : snapshot.data.data()["pengeluaran"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Status Belum Bekerja",
                          style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Tidak Ada Data Pendapatan & Pengeluaran",
                          style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
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
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Selengkapnya",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF00B686)),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Container buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Color(0xFF00B686),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\±$amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "($percentage%)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade300),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0XFF00B686)),
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => NotFound())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildActivityButtonRiwayat(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => RiwayatPage())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildActivityButtonLayanan(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => LayananPage())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildActivityPengaduan(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PengaduanPage())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildActivityBiodata(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => BiodataPage()));
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
