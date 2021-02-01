import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider<User>.value(value: Fireservice.userStream),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kelurahanku',
        home: SplashScreenPage(),
      ),
    ),
  );
}
