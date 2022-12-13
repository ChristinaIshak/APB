import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/antrianpasien.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';

import 'package:http/http.dart' as http;

class AddAntrian extends StatefulWidget {
  const AddAntrian({super.key});

  @override
  State<AddAntrian> createState() => _AddAntrianState();
}

class _AddAntrianState extends State<AddAntrian> {
  TextEditingController textControllerNamaPasien = TextEditingController();
  TextEditingController textControllerNoHp = TextEditingController();
  TextEditingController textControllerKeluhan = TextEditingController();
  TextEditingController textControllerStatus = TextEditingController();
  dynamic dataBarang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset('images/logo.png'),
          )
        ],
        backgroundColor: Color.fromRGBO(139, 195, 74, 1),
        title: Text("Daftar Antrian"),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNamaPasien,
              decoration: InputDecoration(
                  labelText: "Nama Pasien",
                  hintText: "inputkan Nama Pasien",
                  icon: Icon(Icons.code)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNoHp,
              decoration: InputDecoration(
                  labelText: "Nomor Handphone",
                  hintText: "inputkan Nomor Handphone",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerKeluhan,
              decoration: InputDecoration(
                  labelText: "Keluhan",
                  hintText: "inputkan Keluhan",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerStatus,
              decoration: InputDecoration(
                  labelText: "Status",
                  hintText: "inputkan Status",
                  icon: Icon(Icons.person)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Simpan Data"),
                onPressed: () {
                  tambahData(
                      textControllerNamaPasien.text,
                      textControllerNoHp.text,
                      textControllerKeluhan.text,
                      textControllerStatus.text);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AntrianPasien();
                  }), (r) {
                    return false;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tambahData(
      String nama_pasien, String no_hp, String keluhan, String status) async {
    String sql =
        "http://10.0.2.2/puskesmas/addantrian.php?nama_pasien=$nama_pasien&no_hp=$no_hp&keluhan=$keluhan&status=$status";
    await http.get(Uri.parse(sql));
  }
}
