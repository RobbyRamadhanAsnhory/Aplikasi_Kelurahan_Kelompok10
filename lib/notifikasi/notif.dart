import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/data/constants.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1,
        title: Text("Notifikasi"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          FutureBuilder<QuerySnapshot>(
              future: Fireservice.getLayanan(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data.docs.length == 0) {
                  return Center(
                      child: Text("Tidak ada layanan yang sedang d proses"));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green[200],
                      ),
                      child: Text(
                        "Anda Sedang Melakukan Permintaan ${snapshot.data.docs[index].data()["pelayanan"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 3,
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
