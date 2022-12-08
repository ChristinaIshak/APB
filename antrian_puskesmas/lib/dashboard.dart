import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Beranda"),
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
