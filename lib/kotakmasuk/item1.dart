import 'package:flutter/material.dart';

class ItemPertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Image.asset(
              "lib/images/chat1.jpeg",
              width: 300.0,
              height: 300.0,
            ),
            Text(
              "Kamu bisa melihat semua chat kamu disini ya",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
