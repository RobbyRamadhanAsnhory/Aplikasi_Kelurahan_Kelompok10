import 'package:flutter/material.dart';
import 'constants.dart';
import 'validation.dart';
import 'Home.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validation {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  final formKey = GlobalKey<FormState>(); //MEMBUAT GLOBAL KEY UNTUK VALIDASI

  // DEFINE VARIABLE
  String nama = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: formKey, //MENGGUNAKAN GLOBAL KEY
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    _iconLogin(),
                    _titleDescription(),
                    _textField(),
                    _buildButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "lib/images/logo.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Silahkan Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
        ),
        Text(
          "Silahkan Melakukan Login Untuk Dapat Mengakses Pelayanan Kelurahanku",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: myUsernameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Masukan Username",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          validator:
              validateName, //validateName ADALAH NAMA FUNGSI PADA FILE validation.dart
          onSaved: (String value) {
            //KETIKA LOLOS VALIDASI
            nama =
                value; //MAKA VARIABLE name AKAN DIISI DENGAN TEXT YANG TELAH DI-INPUT
          },
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: myPasswordController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Masukan Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          validator:
              validatePassword, ////BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
          onSaved: (String value) {
            password = value;
          },
          style: TextStyle(color: Colors.white),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        //ngambil value dari widget textfield
        nUsername = myUsernameController.text;
        nPassword = myPasswordController.text;
        //formKey ADALAH GLOBAL KEY, KEMUDIAN DIIKUTI DENGAN currentState
        //LALU METHOD validate(), NILAINYA ADALAH FALSE / TRUE
        if (formKey.currentState.validate()) {
          if (nUsername != 'RobbyRamadhanA') {
            print("Username Salah!");
          } else if (nPassword != '1234') {
            print("Password Salah!");
          } else {
            //aksi pindah
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageHome(
                          nama: nUsername,
                          password:
                              nPassword, // variable yang di pass ke page home
                        )));
          }
        }
      },
      //JIKA TRUE
      //MAKA FUNGSI SAVE() DIJALANKAN

      //DISINI KAMU BISA MENGHANDLE DATA YANG SDH DITAMPUNG PADA MASING-MASING VARIABLE
      //KAMU DAPAT MENGIRIMNYA KE API ATAU APAPUN
      //NAMUN UNTUK SEMENTARA KITA PRINT KE CONSOLE SAJA
      //KARENA BELUM MEMBAHAS TENTANG HTTP REQUEST

      child: Text('Login'),
    );
  }
}
