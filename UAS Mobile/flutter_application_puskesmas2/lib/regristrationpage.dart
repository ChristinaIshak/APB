import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/helpers/dbhelper.dart';
import 'package:flutter_application_puskesmas2/models/user.dart';
import 'package:http/http.dart' as http;

class regristrationpage extends StatefulWidget {
  const regristrationpage({Key? key}) : super(key: key);

  @override
  State<regristrationpage> createState() => _regristrationpageState();
}

class _regristrationpageState extends State<regristrationpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  TextEditingController textControllerEmail = TextEditingController();

  DbHelper dbHelper = new DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: false,
            child: Form(
                key: formKey,
                child: ListView(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 30, top: 30),
                      child: (Image.asset('images/logodantext.png',
                          height: 64,
                          width: 229,
                          alignment: Alignment.bottomLeft))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Registrasi",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 130, 71),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          width: 329,
                          height: 45,
                          child: TextFormField(
                            controller: textControllerUsername,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                filled: true,
                                fillColor: Color.fromRGBO(232, 239, 221, 1),
                                hintText: "Inputkan username",
                                labelText: "Username"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Inputkan Username";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 329,
                          height: 45,
                          child: TextFormField(
                            controller: textControllerPassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                filled: true,
                                fillColor: Color.fromRGBO(232, 239, 221, 1),
                                hintText: "Inputkan Password",
                                labelText: "Password"),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 329,
                          height: 45,
                          child: TextFormField(
                            controller: textControllerEmail,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                filled: true,
                                fillColor: Color.fromRGBO(232, 239, 221, 1),
                                hintText: "Inputkan email",
                                labelText: "Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "inputkan email";
                              }
                              if (EmailValidator.validate(value)) {
                                return null;
                              } else {
                                return "format email salah";
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Container(
                      width: 136,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(139, 195, 74, 1)),
                          child: const Text("Regristration",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //data disimpan
                              User user = new User(
                                  textControllerUsername.text,
                                  textControllerPassword.text,
                                  textControllerEmail.text);
                              dbHelper.insertUser(user).then((value) {
                                if (value == 0) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Insert data user gagal"),
                                    backgroundColor: Colors.red,
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Insert data user Berhasil"),
                                    backgroundColor: Colors.green,
                                  ));
                                }
                              });
                              tambahData(
                                  textControllerUsername.text,
                                  textControllerPassword.text,
                                  textControllerEmail.text);
                              Navigator.pushNamed(context, '/LoginPage');
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Container(
                          child: SizedBox(
                            width: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/LoginPage');
                          },
                          child: Text("<< Halaman Login User Umum",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 130, 71),
                                  fontSize: 12)),
                        )
                      ],
                    ),
                  )
                ]))));
  }

  void tambahData(String username, String password, String email) async {
    String sql =
        "http://10.0.2.2/puskesmas/add.php?username=$username&password=$password&email=$email";
    await http.get(Uri.parse(sql));
  }
}
