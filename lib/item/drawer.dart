import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/Login.dart';
import 'package:uas_kelurahan_kelompok10/bantuan.dart';
import 'package:uas_kelurahan_kelompok10/data/constants.dart';
import 'package:uas_kelurahan_kelompok10/item/bottomnav.dart';
import 'package:uas_kelurahan_kelompok10/pengaduan.dart';
import 'package:uas_kelurahan_kelompok10/profile.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'package:uas_kelurahan_kelompok10/settingprofile.dart';

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
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => BottomNav());
              Navigator.push(context, route);
            },
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.announcement_outlined),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => BantuanPage());
              Navigator.push(context, route);
            },
            title: Text(
              'Bantuan',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => SettingProfilePage());
              Navigator.push(context, route);
            },
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            onTap: () async {
              Route route =
                  MaterialPageRoute(builder: (context) => LoginPage());
              Fireservice.signout();
              Navigator.pushAndRemoveUntil(context, route, (route) => false);
            },
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
