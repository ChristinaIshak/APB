import 'package:flutter/material.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();

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
                    "Login Admin",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 130, 71),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 50, bottom: 50, left: 30, right: 30),
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
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Container(
                      width: 136,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(139, 195, 74, 1)),
                          child: const Text("Login as Admin"),
                          onPressed: () {
                            String admin2 = "admin2";
                            String pass = "12345";
                            if (textControllerUsername.text == admin2 &&
                                textControllerPassword.text == pass) {
                              Navigator.pushNamed(
                                context,
                                '/dashboard',
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Login Gagal"),
                              ));
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
}
