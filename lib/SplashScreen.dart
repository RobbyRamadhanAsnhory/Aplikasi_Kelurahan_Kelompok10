import 'package:flutter/material.dart';
import 'constants.dart';
import 'Login.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return LoginPage();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _title(),
                  _iconLogin(),
                  _titleDescription(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 150.0),
        ),
        Text(
          "Aplikasi KEBAB",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _iconLogin() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0),
        ),
        Image.asset(
          "lib/images/logo.png",
          width: 150.0,
          height: 150.0,
        )
      ],
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0),
        ),
        Text(
          "Kelurahan Babakan Ciparay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.0),
        ),
        Text(
          "Kota Bandung",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
