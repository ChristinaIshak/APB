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
        appBar: AppBar(
            title: const Text("Login Page Admin"),
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
                    ]))));
  }
}
