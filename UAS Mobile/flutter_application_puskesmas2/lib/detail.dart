import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';

import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  const Detail({super.key, required arguments});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController textControllerIdTiket = TextEditingController();
  TextEditingController textControllerNama = TextEditingController();
  TextEditingController textControllerNoHp = TextEditingController();
  TextEditingController textControllerKeluhan = TextEditingController();
  TextEditingController textControllerStatus = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataPasien = ModalRoute.of(context)!.settings.arguments;
    textControllerIdTiket.text = dataPasien['id_tiket'].toString();
    textControllerNama.text = dataPasien['nama_pasien'].toString();
    textControllerNoHp.text = dataPasien['no_hp'].toString();
    textControllerKeluhan.text = dataPasien['keluhan'].toString();
    textControllerStatus.text = dataPasien['status'].toString();
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
            child: Text("Detail Pasien " + dataPasien['nama_pasien']),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNama,
              decoration: InputDecoration(
                  labelText: "Nama Pasien",
                  hintText: "inputkan nama",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: textControllerNoHp,
                decoration: InputDecoration(
                    labelText: "Nomor Handphone",
                    hintText: "Inputkan no hp",
                    icon: Icon(Icons.phone))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerKeluhan,
              decoration: InputDecoration(
                  labelText: "Keluhan",
                  hintText: "Inputkan Keluhan",
                  icon: Icon(Icons.note)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerStatus,
              decoration: InputDecoration(
                  labelText: "Status",
                  hintText: "Inputkan status",
                  icon: Icon(Icons.verified)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Ubah Data"),
                onPressed: () {
                  dataPasien['id_tiket'] = textControllerIdTiket.text;
                  dataPasien['nama_pasien'] = textControllerNama.text;
                  dataPasien['no_hp'] = textControllerNoHp.text;
                  dataPasien['keluhan'] = textControllerKeluhan.text;
                  dataPasien['status'] = textControllerStatus.text;
                  editData(dataPasien);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return TabelAntrian();
                  }), (r) {
                    return false;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Hapus Data"),
                onPressed: () {
                  hapusData(dataPasien['id_tiket'].toString());
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return TabelAntrian();
                  }), (r) {
                    return false;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void hapusData(String id_tiket) async {
    String sql = "http://10.0.2.2/puskesmas/delete.php?id_tiket=$id_tiket";
    await http.get(Uri.parse(sql));
  }

  void editData(dynamic dataPasien) async {
    String id_tiket = dataPasien['id_tiket'];
    String nama_pasien = dataPasien['nama_pasien'];
    String no_hp = dataPasien['no_hp'];
    String keluhan = dataPasien['keluhan'].toString();
    String status = dataPasien['status'].toString();
    String sql =
        "http://10.0.2.2/puskesmas/edit.php?id_tiket=$id_tiket&nama_pasien=$nama_pasien&no_hp=$no_hp&keluhan=$keluhan&status=$status";
    await http.get(Uri.parse(sql));
  }
}
