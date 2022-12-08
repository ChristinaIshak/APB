import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';

import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  const Detail({super.key, required arguments});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController textControllerNama = TextEditingController();
  TextEditingController textControllerNoHp = TextEditingController();
  TextEditingController textControllerKeluhan = TextEditingController();
  TextEditingController textControllerStatus = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataPasien = ModalRoute.of(context)!.settings.arguments;
    textControllerNama.text = dataPasien['nama_pasien'].toString();
    textControllerNoHp.text = dataPasien['no_hp'].toString();
    textControllerKeluhan.text = dataPasien['keluhan'].toString();
    textControllerStatus.text = dataPasien['status'].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Detail"),
        backgroundColor: Color.fromRGBO(139, 195, 74, 1),
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
        ],
      ),
    );
  }
}
