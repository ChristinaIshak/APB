import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new dashboard(),
  ));
}

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Future<List<dynamic>> getData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/puskesmas/count.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                                          context, '/dashboard');
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
                                      Navigator.pushNamed(context, '/jadwal');
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
                                          context, '/tabelantrian');
                                    },
                                    child: Text(
                                      "Tabel Antrian",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 130, 71)),
                                    )),
                                leading: new Icon(Icons.table_chart)),
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
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.shrink(); //<---here
          } else {
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  //const ItemList({super.key});
  final List<dynamic> list;
  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    if (list != null) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
              child: Column(children: [
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Jumlah Antrian",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(254, 254, 254, 1),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(list[index]['tb_hitung'],
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(254, 254, 254, 1),
                              ))
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset('images/Group17.png'),
                ),
              ],
            ),
          ]));
        },
      );
    } else {
      return Text(" No Data");
    }
  }
}
