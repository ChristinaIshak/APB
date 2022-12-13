import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/jadwal.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';

import 'package:http/http.dart' as http;

class AddJadwal extends StatefulWidget {
  const AddJadwal({super.key});

  @override
  State<AddJadwal> createState() => _AddJadwalState();
}

class _AddJadwalState extends State<AddJadwal> {
  TextEditingController textControllerHari = TextEditingController();
  TextEditingController textControllerNamaDokter = TextEditingController();
  TextEditingController textControllerPoli = TextEditingController();
  TextEditingController textControllerJam = TextEditingController();
  dynamic dataTambahJadwal;
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerHari,
              decoration: InputDecoration(
                  labelText: "Hari",
                  hintText: "inputkan Hari",
                  icon: Icon(Icons.code)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNamaDokter,
              decoration: InputDecoration(
                  labelText: "Nama Dokter",
                  hintText: "Inputkan Nama Dokter",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerPoli,
              decoration: InputDecoration(
                  labelText: "Poli",
                  hintText: "Inputkan Poli",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerJam,
              decoration: InputDecoration(
                  labelText: "Jam",
                  hintText: "Inputkan Jam",
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
                      textControllerHari.text,
                      textControllerNamaDokter.text,
                      textControllerPoli.text,
                      textControllerJam.text);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Jadwal();
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
      String hari, String nama_dokter, String poli, String jam) async {
    String sql =
        "http://10.0.2.2/puskesmas/addjadwal.php?hari=$hari&nama_dokter=$nama_dokter&poli=$poli&jam=$jam";
    await http.get(Uri.parse(sql));
  }
}
