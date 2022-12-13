import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/jadwal.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';

import 'package:http/http.dart' as http;

class DetailPasien extends StatefulWidget {
  const DetailPasien({super.key, required arguments});

  @override
  State<DetailPasien> createState() => _DetailPasienState();
}

class _DetailPasienState extends State<DetailPasien> {
  TextEditingController textControllerId = TextEditingController();
  TextEditingController textControllerJam = TextEditingController();
  TextEditingController textControllerHari = TextEditingController();
  TextEditingController textControllerNamaDokter = TextEditingController();
  TextEditingController textControllerPoli = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataJadwal = ModalRoute.of(context)!.settings.arguments;
    textControllerId.text = dataJadwal['id_jadwal'].toString();
    textControllerHari.text = dataJadwal['hari'].toString();
    textControllerJam.text = dataJadwal['jam'].toString();
    textControllerNamaDokter.text = dataJadwal['nama_dokter'].toString();
    textControllerPoli.text = dataJadwal['poli'].toString();
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
          Padding(
            padding: EdgeInsets.all(8),
            child: Text("Detail Jadwal " + dataJadwal['hari']),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: textControllerHari,
                decoration: InputDecoration(
                    labelText: "Hari",
                    hintText: "Inputkan Hari",
                    icon: Icon(Icons.phone))),
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
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNamaDokter,
              decoration: InputDecoration(
                  labelText: "Nama Dokter",
                  hintText: "Inputkan Nama Dokter",
                  icon: Icon(Icons.note)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerPoli,
              decoration: InputDecoration(
                  labelText: "Poli",
                  hintText: "Inputkan Poli",
                  icon: Icon(Icons.verified)),
            ),
          ),
        ],
      ),
    );
  }

  void hapusData(String id_jadwal) async {
    String sql =
        "http://10.0.2.2/puskesmas/deletejadwal.php?id_jadwal=$id_jadwal";
    await http.get(Uri.parse(sql));
  }

  void editData(dynamic dataJadwal) async {
    String id_jadwal = dataJadwal['id_jadwal'];
    String hari = dataJadwal['hari'];
    String jam = dataJadwal['jam'];
    String nama_dokter = dataJadwal['nama_dokter'].toString();
    String poli = dataJadwal['poli'].toString();
    String sql =
        "http://10.0.2.2/puskesmas/editjadwal.php?id_jadwal=$id_jadwal&hari=$hari&jam=$jam&nama_dokter=$nama_dokter&poli=$poli";
    await http.get(Uri.parse(sql));
  }
}
