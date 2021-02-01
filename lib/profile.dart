import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uas_kelurahan_kelompok10/Home.dart';
import 'package:uas_kelurahan_kelompok10/editprofile.dart';
import 'package:uas_kelurahan_kelompok10/service.dart';
import 'settingprofile.dart';
import 'data/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserApp userApp;
  bool showPassword = false;
  User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Fireservice.getdataUser(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                            ),
                            child: snapshot.data.data()["profile"] != null ||
                                    snapshot.data.data()["profile"] != ""
                                ? Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data.data()["profile"],
                                        ),
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 80,
                                    color: Colors.grey[400],
                                  ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  var image = await ImagePicker().getImage(
                                    source: ImageSource.camera,
                                  );
                                  if (image != null) {
                                    File file = File(image.path);

                                    String filename = basename(file.path);

                                    var res = await FirebaseStorage.instance
                                        .ref()
                                        .child(filename)
                                        .putFile(file)
                                        .whenComplete(() {})
                                        .then(
                                      (task) async {
                                        return await task.ref.getDownloadURL();
                                      },
                                    );

                                    await Fireservice.updateProfile(
                                      snapshot.data.data()["id"],
                                      res,
                                    );

                                    setState(() {});
                                  }
                                  return;
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    buildTextField(
                        "Full Name", snapshot.data.data()["nama"], false),
                    buildTextField(
                        "E-mail", snapshot.data.data()["email"], false),
                    buildTextField("Location",
                        snapshot.data.data()["tempat_lahir"], false),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
