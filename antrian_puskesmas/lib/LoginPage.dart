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
        appBar: AppBar(
            title: const Text("Login Page"),
            backgroundColor: Color.fromRGBO(139, 195, 74, 1)),
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(139, 195, 74, 1)),
                          child: const Text("Login"),
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
                                  Navigator.pushNamed(context, '/dashboard',
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
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text(
                                "Login as Administrator",
                                style: TextStyle(
                                    color: Color.fromRGBO(139, 195, 74, 1)),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/loginadmin'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text(
                                "Regristration",
                                style: TextStyle(
                                    color: Color.fromRGBO(139, 195, 74, 1)),
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, '/regristrationpage'),
                            ),
                          ),
                        ],
                      )
                    ]))));
  }
}
