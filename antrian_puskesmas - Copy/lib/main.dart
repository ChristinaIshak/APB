import 'package:flutter/material.dart';
import 'package:flutter_application_puskesmas2/dashboard.dart';
import 'package:flutter_application_puskesmas2/jadwal.dart';
import 'package:flutter_application_puskesmas2/loginadmin.dart';
import 'package:flutter_application_puskesmas2/loginpage.dart';
import 'package:flutter_application_puskesmas2/regristrationpage.dart';
import 'package:flutter_application_puskesmas2/tabelantrian.dart';
import 'package:flutter_application_puskesmas2/detail.dart';
import 'package:flutter_application_puskesmas2/detailjadwal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/LoginPage',
      routes: {
        '/LoginPage': (context) => LoginPage(),
        '/regristrationpage': (context) => regristrationpage(),
        '/dashboard': (context) => dashboard(),
        '/loginadmin': (context) => LoginAdmin(),
        '/tabelantrian': (context) => TabelAntrian(),
        '/detail': (context) => Detail(
              arguments: null,
            ),
        '/jadwal': (context) => Jadwal(),
        '/detailjadwal': (context) => DetailJadwal(
              arguments: null,
            ),
      },
    );
  }
}
