import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/jadwal.dart';
import 'package:flutter_application_puskesmas2/main.dart';

import 'package:http/http.dart' as http;

class DetailJadwal extends StatefulWidget {
  const DetailJadwal({super.key, required arguments});

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  TextEditingController textControllerHari = TextEditingController();
  TextEditingController textControllerJam = TextEditingController();
  TextEditingController textControllerNamaDokter = TextEditingController();
  TextEditingController textControllerPoli = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataJadwal = ModalRoute.of(context)!.settings.arguments;
    textControllerHari.text = dataJadwal['hari'].toString();
    textControllerJam.text = dataJadwal['jam'].toString();
    textControllerNamaDokter.text = dataJadwal['nama_dokter'].toString();
    textControllerPoli.text = dataJadwal['poli'].toString();
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Detail Jadwal")),
      body: Column(
        children: [
          Text(dataJadwal['hari']),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerHari,
              decoration: InputDecoration(
                  labelText: "Hari",
                  hintText: "inputkan Hari",
                  icon: Icon(Icons.date_range)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerJam,
              decoration: InputDecoration(
                  labelText: "Jam",
                  hintText: "inputkan Jam",
                  icon: Icon(Icons.alarm)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Ubah Data"),
                onPressed: () {
                  dataJadwal['hari'] = textControllerHari.text;
                  dataJadwal['jam'] = textControllerJam.text;
                  dataJadwal['nama_dokter'] = textControllerNamaDokter.text;
                  dataJadwal['poli'] = textControllerPoli.text;
                  editData(dataJadwal);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Jadwal();
                  }), (r) {
                    return false;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Hapus Data"),
                onPressed: () {
                  hapusData(dataJadwal['id_jadwal'].toString());
                  //Navigator.pushNamed(context, '/main');

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

  void hapusData(String id_jadwal) async {
    String sql =
        "http://10.0.2.2/puskesmas/deletejadwal.php?id_jadwal=$id_jadwal";
    await http.get(Uri.parse(sql));
  }

  void editData(dynamic dataJadwal) async {
    String hari = dataJadwal['hari'];
    String id_jadwal = dataJadwal['id_jadwal'];
    String jam = dataJadwal['jam'];
    String nama_dokter = dataJadwal['nama_dokter'].toString();
    String poli = dataJadwal['poli'].toString();
    String sql =
        "http://10.0.2.2/puskesmas/editjadwal.php?id_jadwal=$id_jadwal&hari=$hari&jam=$jam&nama_dokter=$nama_dokter&poli=$poli";
    await http.get(Uri.parse(sql));
  }
}
