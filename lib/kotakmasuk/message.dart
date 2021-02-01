import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/item/bottomnav.dart';
import '../data/constants.dart';
import 'item1.dart' as item1;
import 'item2.dart' as item2;

class KotakMasukPage extends StatefulWidget {
  @override
  _KotakMasukPageState createState() => _KotakMasukPageState();
}

class _KotakMasukPageState extends State<KotakMasukPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Kotak Masuk'),
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Chat",
            ),
            new Tab(
              text: "Notifikasi",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          item1.ItemPertama(),
          item2.ItemKedua(),
        ],
      ),
    );
  }
}
