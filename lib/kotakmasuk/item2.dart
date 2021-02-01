import 'package:flutter/material.dart';

class ItemKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: new EdgeInsets.only(top: 50)),
            Image.asset(
              "lib/images/chat2.jpeg",
              width: 270.0,
              height: 270.0,
            ),
            Text(
              "Udah kebaca semua",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: new EdgeInsets.only(top: 10)),
            Center(
              child: Text(
                "Notifikasi dari kelurahan bakal kelihatan disini. Kami bakal kasih tahu kalau ada yang baru.",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
