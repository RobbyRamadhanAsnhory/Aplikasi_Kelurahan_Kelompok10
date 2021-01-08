import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/pengaduan.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  int _selectedItemIndex = 0;
  final List pages = [
    null,
    null,
    null,
    PengaduanPage(),
    null,
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.blueGrey[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.insert_chart),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.done),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.chat_bubble),
              ),
            ],
          ),
          body: pages[_selectedItemIndex]),
    );
  }
}
