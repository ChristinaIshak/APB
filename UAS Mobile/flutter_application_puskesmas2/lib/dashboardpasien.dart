import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new DashboardPasien(),
  ));
}

class DashboardPasien extends StatefulWidget {
  @override
  State<DashboardPasien> createState() => _DashboardPasienState();
}

class _DashboardPasienState extends State<DashboardPasien> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset('images/logo.png'),
          )
        ],
        backgroundColor: Color.fromRGBO(139, 195, 74, 1),
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.asset('images/logodantext.png',
                          height: 100,
                          width: 300,
                          alignment: Alignment.bottomLeft),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Column(
                          children: [
                            ListTile(
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/dashboardpasien');
                                    },
                                    child: Text(
                                      "Dashboard",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 130, 71)),
                                    )),
                                leading: new Icon(Icons.home)),
                            ListTile(
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/jadwalpasien');
                                    },
                                    child: Text(
                                      "Jadwal Berobat",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 130, 71)),
                                    )),
                                leading: new Icon(Icons.calendar_month)),
                            ListTile(
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/antrianpasien');
                                    },
                                    child: Text(
                                      "Tabel Antrian",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 130, 71)),
                                    )),
                                leading: new Icon(Icons.table_chart)),
                            ListTile(
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/addantrian');
                                    },
                                    child: Text(
                                      "Daftar Antrian",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 130, 71)),
                                    )),
                                leading: new Icon(Icons.queue)),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: ListTile(
                                  title: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/LoginPage');
                                      },
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 9, 130, 71)),
                                      )),
                                  leading: new Icon(Icons.logout)),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
      body: new Column(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset('images/Group10.png'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                color: Color.fromRGBO(156, 208, 89, 1),
                width: 250.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset('images/Group17.png'),
            ),
          ],
        ),
      ]),
    );
  }
}
