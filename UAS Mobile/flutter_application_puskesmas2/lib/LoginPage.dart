import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/helpers/dbhelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();

  DbHelper dbHelper = new DbHelper();

  int itid = 10;

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
                    "Login",
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
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(232, 239, 221, 1),
                                  hintText: "Inputkan Password",
                                  labelText: "Password"),
                              obscureText: true,
                            ),
                          )
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      children: [
                        (GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/regristrationpage');
                          },
                          child: Text("Belum punya akun?Daftar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 130, 71),
                                  fontSize: 12)),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80, right: 80),
                    child: Container(
                      width: 136,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(139, 195, 74, 1)),
                          child: const Text("Login",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          onPressed: () {
                            bool userFound = false;
                            if (formKey.currentState!.validate()) {
                              dbHelper
                                  .selectUser(textControllerUsername.text,
                                      textControllerPassword.text)
                                  .then((mapList) {
                                mapList.forEach((element) {
                                  if (element['username'] ==
                                          textControllerUsername.text &&
                                      element['password'] ==
                                          textControllerPassword.text) {
                                    userFound = true;
                                  }
                                });
                                if (userFound == true) {
                                  Navigator.pushNamed(
                                      context, '/dashboardpasien',
                                      arguments: textControllerUsername.text);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Login Gagal"),
                                  ));
                                }
                              });
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Container(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/loginadmin');
                          },
                          child: Text("Halaman Login Admin >>",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 130, 71),
                                  fontSize: 12)),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
