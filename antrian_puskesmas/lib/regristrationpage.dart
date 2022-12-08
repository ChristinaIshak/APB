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
        appBar: AppBar(title: const Text("Regristration Page")),
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: textControllerUsername,
                            decoration: const InputDecoration(
                                hintText: "Inputkan username",
                                icon: Icon(Icons.person)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Inputkan Username";
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: textControllerPassword,
                            decoration: const InputDecoration(
                                hintText: "Inputkan Password",
                                icon: Icon(Icons.lock)),
                            obscureText: true,
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: textControllerEmail,
                            decoration: const InputDecoration(
                                hintText: "Inputkan email",
                                icon: Icon(Icons.lock)),
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
                          )),
                      ElevatedButton(
                          child: const Text("Regristration"),
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
                    ]))));
  }

  void tambahData(String username, String password, String email) async {
    String sql =
        "http://10.0.2.2/puskesmas/add.php?username=$username&password=$password&email=$email";
    await http.get(Uri.parse(sql));
  }
}
