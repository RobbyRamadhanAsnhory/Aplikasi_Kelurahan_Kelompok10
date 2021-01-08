import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/constants.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: ColorPalette.primaryColor,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Lambang_Kota_Bandung.svg/1043px-Lambang_Kota_Bandung.svg.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  'Kelurahan Babakan Ciparay',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Kota Bandung',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Info Desa',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.announcement_outlined),
            title: Text(
              'Bantuan',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}