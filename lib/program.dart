import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/acaraagustus.dart';
import 'package:uas_kelurahan_kelompok10/bantuansembako.dart';
import 'package:uas_kelurahan_kelompok10/kerjabakti.dart';
import 'package:uas_kelurahan_kelompok10/pengaduan.dart';
import 'package:uas_kelurahan_kelompok10/posyandu.dart';
import 'data/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProgramPage extends StatefulWidget {
  @override
  _ProgramPageState createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program'),
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
      body: Container(
        child: ListView(
          children: <Widget>[
            bagianheader(),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Program Desa",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18),
              ),
            ),
            buildImageInteractionCard(context),
            SizedBox(
              height: 10,
            ),
            buildImageInteractionCard2(context),
            SizedBox(
              height: 10,
            ),
            buildImageInteractionCard3(context),
            SizedBox(
              height: 10,
            ),
            buildImageInteractionCard4(context),
          ],
        ),
      ),
    );
  }

  Stack bagianheader() {
    return Stack(
      children: [
        Container(
          height: 145,
          decoration: BoxDecoration(
            //color: Color(0xFFD4E7FE),
            gradient:
                LinearGradient(colors: [Color(0XFF00B686), Color(0XFF00838F)]),
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
      ],
    );
  }

  Widget buildImageInteractionCard(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1504173905/IMG-20170827-WA0001_eygiut.jpg',
                  ),
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Acara 17 Agustus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 5),
              child: Text(
                'Pada Bulan Agustus Tepat Pada Tanggal 17 Agustus Kelurahan Babakan Ciparay Rutin Melaksanakan Kegiatan 17 Agustus Setiap Tahunnya Dengan Ikuti 9 Rw Didalammnya',
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AcaraAgustusPage()));
                },
                child: Text(
                  "Selengkapnya",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF00B686),
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
}

Widget buildImageInteractionCard2(BuildContext context) => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(
                  'https://timur.jakarta.go.id/v15/assets/images/content/news/t_1587522375.jpeg',
                ),
                height: 170,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Bantuan Sembako',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 5),
            child: Text(
              'Pada Masa Pandemic ini Warga Kelurahan Babakan Ciparay Mendapat Bantuan Lansung Tunai Berupa Sembako dan uang Tunai Sebesar Rp.100.000 Dari Pemerintah Jawabarat.',
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => BantuanSembakoPage()));
              },
              child: Text(
                "Selengkapnya",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF00B686),
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildImageInteractionCard3(BuildContext context) => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(
                  'https://batiktv.pekalongankota.go.id/upload/berita/berita_20200313025012.png',
                ),
                height: 170,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Kerja Bakti',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 5),
            child: Text(
              'Setiap Seminggu Sekali Tepatnya Pada Hari Jumat Masyarakat Kelurahan Babakan Ciparay Rutin Melaksanakan Kerja Bakti',
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => KerjaBaktiPage()));
              },
              child: Text(
                "Selengkapnya",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF00B686),
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildImageInteractionCard4(BuildContext context) => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(
                  'https://tribratanews.polresjember.id/wp-content/uploads/2020/06/IMG-20200604-WA0410-1024x768.jpg',
                ),
                height: 170,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Posyandu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 5),
            child: Text(
              'diharapkan kepada para orang tua yang memiliki balita supaya meningkatkan kesadaran untuk aktif menjaga kestabilan kesehatan putra putrinya dengan rutin ikut penimbangan',
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PosyanduPage()));
              },
              child: Text(
                "Selengkapnya",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF00B686),
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
