import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/material/data_table.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new TabelAntrian(),
  ));
}

class TabelAntrian extends StatefulWidget {
  @override
  State<TabelAntrian> createState() => _TabelAntrianState();
}

class _TabelAntrianState extends State<TabelAntrian> {
  Future<List<dynamic>> getData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/puskesmas/getalldata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tabel Antrian"),
        backgroundColor: Color.fromRGBO(139, 195, 74, 1),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new DrawerHeader(
                  child: Column(
                children: [
                  new CircleAvatar(),
                ],
              )),
              color: Color.fromRGBO(139, 195, 74, 1),
            ),
            new ListTile(
              title: new TextButton(
                  child: Text("Beranda"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  }),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new TextButton(
                  child: Text("Tabel Antrian"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tabelantrian');
                  }),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new TextButton(
                  child: Text("Jadwal Berobat"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/jadwal');
                  }),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new TextButton(
                  child: Text("Logout"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/LoginPage');
                  }),
              trailing: new Icon(Icons.close),
            )
          ],
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
          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/detail',
                  arguments: list[index]),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(columns: [
                    DataColumn(label: Text("Antrian")),
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Aksi"))
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        list[index]["id_tiket"],
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        list[index]["nama_pasien"],
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        list[index]["status"],
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/detail');
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      )),
                    ])
                  ]),
                ),
              ));
        },
      );
    } else {
      return Text(" No Data");
    }
  }
}
