import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/editprofile.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'data/constants.dart';
import 'data/user.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
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
            decoration: BoxDecoration(
              //color: Color(0xFFD4E7FE),
              gradient: LinearGradient(
                  colors: [Color(0XFF00B686), Color(0XFF00838F)]),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 8,
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "http://img.bandungnewsphoto.com/2018-07/660/24072018-logo-pemkot-bandung-1.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kelurahan Babakam Ciparay",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Color(0XFF343E87),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Jl.Babakan Ciparay No.121",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Kota Bandung",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 130,
            child: FutureBuilder<DocumentSnapshot>(
                future: Fireservice.getdataUser(user.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height - 78,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView(
                      children: [
                        buildClassItem(snapshot.data),
                        SizedBox(
                          height: 20,
                        ),
                        buildTitleRow("Biodata"),
                        SizedBox(
                          height: 25,
                        ),
                        buildClassItem2(snapshot.data),
                        buildClassItem3(),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Row buildTitleRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Container buildClassItem(DocumentSnapshot snapshot) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
      padding: EdgeInsets.all(20),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "Nik      :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["nik"]),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Nama :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["nama"]),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Email  :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["email"]),
            ],
          ),
        ],
      ),
    );
  }

  Container buildClassItem2(DocumentSnapshot snapshot) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(20),
      height: 380,
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "Tanggal Lahir :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["tanggal_lahir"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Tempat Lahir :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["tempat_lahir"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Jenis Kelamin :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["jenis_kelamin"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Gol.Darah :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["gol_darah"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Agama :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["agama"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Pendidikan Terakhir :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["pendidikan_terakhir"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Pekerjaan :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["pekerjaan"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Status Perkawinan :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["status_pernikahan"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Alamat :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["alamat"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Pendapatan :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["pendapatan"]),
            ],
          ),
          Row(
            children: [
              Text(
                "Pengeluaran :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(snapshot.data()["pengeluaran"]),
            ],
          ),
          RaisedButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      EditProfilePage(snapshot)));
              setState(() {});
            },
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 50),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Edit",
              style: TextStyle(
                  fontSize: 14, letterSpacing: 2.2, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container buildClassItem3() {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
      padding: EdgeInsets.all(20),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
