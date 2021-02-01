import 'package:flutter/material.dart';
import 'data/user.dart';
import 'editprofile.dart';

class Coba extends StatefulWidget {
  @override
  _CobaState createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  @override
  UserApp userApp;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                      ),
                      child: userApp != null
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    userApp.image,
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
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            userApp != null ? userApp.name : 'Robby',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 350, height: 1, color: Colors.grey),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Robby",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 350, height: 1, color: Colors.grey),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Robby",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 350, height: 1, color: Colors.grey),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Robby",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 350, height: 1, color: Colors.grey),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Robby",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 350, height: 1, color: Colors.grey),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                    context,
                    '/editprofile',
                    arguments: userApp,
                  );

                  if (result != null) {
                    userApp = result;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
