import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'data/user.dart';

class EditProfilePage extends StatefulWidget {
  DocumentSnapshot snaphot;
  EditProfilePage(this.snaphot);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var tanggal_lahir = TextEditingController();
  var tempat_lahir = TextEditingController();
  var jenis_kelamin = TextEditingController();
  var gol_darah = TextEditingController();
  var agama = TextEditingController();
  var pendidikan_terakhir = TextEditingController();
  var pekerjaan = TextEditingController();
  var status_pernikahan = TextEditingController();
  var alamat = TextEditingController();
  var pendapatan = TextEditingController();
  var pengeluaran = TextEditingController();

  @override
  void initState() {
    tanggal_lahir.text = widget.snaphot.data()["tanggal_lahir"];
    tempat_lahir.text = widget.snaphot.data()["tempat_lahir"];
    jenis_kelamin.text = widget.snaphot.data()["jenis_kelamin"];
    gol_darah.text = widget.snaphot.data()["gol_darah"];
    agama.text = widget.snaphot.data()["agama"];
    pendidikan_terakhir.text = widget.snaphot.data()["pendidikan_terakhir"];
    pekerjaan.text = widget.snaphot.data()["pekerjaan"];
    status_pernikahan.text = widget.snaphot.data()["status_pernikahan"];
    alamat.text = widget.snaphot.data()["alamat"];
    pendapatan.text = widget.snaphot.data()["pendapatan"];
    pengeluaran.text = widget.snaphot.data()["pengeluaran"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Biodata',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.blue,
            ),
            onPressed: () => _editProfile(context),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextField(
                    controller: tanggal_lahir,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tanggal Lahir',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: tempat_lahir,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tempat Lahir',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: jenis_kelamin,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Jenis Kelamin',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: gol_darah,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Golongan Darah',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: agama,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Agama',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: pendidikan_terakhir,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Pendidikan Terakhir',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: pekerjaan,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Pekerjaan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: status_pernikahan,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Status Pernikahan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Alamat',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: pendapatan,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Pendapatan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: pengeluaran,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Pengeluaran',
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Biodata Changed'),
          content: Text('Do you want to save your edits?'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('Save'),
              onPressed: () async {
                await Fireservice.dataUser(
                  id: widget.snaphot.id,
                  nama: widget.snaphot.data()["nama"],
                  nik: widget.snaphot.data()["nik"],
                  email: widget.snaphot.data()["email"],
                  tanggal_lahir: tanggal_lahir.text,
                  tempat_lahir: tempat_lahir.text,
                  jenis_kelamin: jenis_kelamin.text,
                  gol_darah: gol_darah.text,
                  agama: agama.text,
                  pendidikan_terakhir: pendidikan_terakhir.text,
                  pekerjaan: pekerjaan.text,
                  status_perkawinan: status_pernikahan.text,
                  alamat: alamat.text,
                  pendapatan: pendapatan.text,
                  pengeluaran: pengeluaran.text,
                );
                //close dialog
                Navigator.pop(context);
                //close page
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
