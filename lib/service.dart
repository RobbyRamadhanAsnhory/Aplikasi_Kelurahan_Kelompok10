import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Fireservice {
  static var _auth = FirebaseAuth.instance;

  static Stream<User> get userStream => _auth.authStateChanges();

  static Future<String> signup(
      {String nama, String email, String nik, String password}) async {
    try {
      var _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await dataUser(id: _result.user.uid, email: email, nik: nik, nama: nama);
      return "Signup Berhasil";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<String> signin(String email, String password) async {
    try {
      var _result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signin Berhasil";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<void> signout() async {
    await _auth.signOut();
  }

  static var _userCollection = FirebaseFirestore.instance.collection('user');
  static Future<void> updateProfile(String id, String profile) async {
    await _userCollection.doc(id).set({
      "profile": profile,
    }, SetOptions(merge: true));
  }

  static Future<void> dataUser({
    String id,
    String nama,
    String email,
    String nik,
    String tanggal_lahir,
    String tempat_lahir,
    String jenis_kelamin,
    String gol_darah,
    String agama,
    String pendidikan_terakhir,
    String pekerjaan,
    String status_perkawinan,
    String alamat,
    String pendapatan,
    String pengeluaran,
  }) async {
    await _userCollection.doc(id).set(
        {
          "id": id,
          "nama": nama,
          "email": email,
          "nik": nik,
          "tanggal_lahir": tanggal_lahir ?? "",
          "tempat_lahir": tempat_lahir ?? "",
          "jenis_kelamin": jenis_kelamin ?? "",
          "gol_darah": gol_darah ?? "",
          "agama": agama ?? "",
          "pendidikan_terakhir": pendidikan_terakhir ?? "",
          "pekerjaan": pekerjaan ?? "",
          "status_pernikahan": status_perkawinan ?? "",
          "alamat": alamat ?? "",
          "pendapatan": pendapatan ?? "",
          "pengeluaran": pengeluaran ?? "",
          "profile": "",
        },
        SetOptions(
          merge: true,
        ));
  }

  static Future<DocumentSnapshot> getdataUser(String id) async {
    return _userCollection.doc(id).get();
  }

  static Future<void> addLayanan(String id, String title) async {
    return _userCollection.doc(id).collection("layanan").doc().set({
      "pelayanan": title,
      "tanggal": DateTime.now().millisecondsSinceEpoch,
      "status": "di proses",
    });
  }

  static Future<QuerySnapshot> getLayanan(String id) async {
    return _userCollection.doc(id).collection("layanan").get();
  }
}
