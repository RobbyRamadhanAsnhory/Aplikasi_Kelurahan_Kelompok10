import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/Login.dart';
import 'package:uas_kelurahan_kelompok10/kalender.dart';
import 'package:uas_kelurahan_kelompok10/kotakmasuk/message.dart';
import 'package:uas_kelurahan_kelompok10/pengaduan.dart';
import 'package:uas_kelurahan_kelompok10/profile.dart';
import 'package:uas_kelurahan_kelompok10/settingprofile.dart';
import 'package:uas_kelurahan_kelompok10/notifikasi/notif.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var screens = [
    PageHome(),
    NotifikasiPage(),
    CalenderPage(),
    ProfilePage(),
  ];
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text('Notifikasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Kalender'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Akun'),
          ),
        ],
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/images/4_File Not Found.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
