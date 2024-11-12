import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse_tek_nesne/Mesajlar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void mesajParse(){
    String strVeri = '{ "mesajlar" : { "mesaj_kod" :1, "mesaj_icerik" : "basarili" } }';

    var jsonVeri = json.decode(strVeri);  //String veri json formatına dönüştü

    var jsonNesne = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.fromJson(jsonNesne); //valueları direk göndermemizi sağlar

    print("Mesaj Kod : ${mesaj.mesaj_kod}");
    print("Mesaj İçerik : ${mesaj.mesaj_icerik}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mesajParse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parse - Tek Nesne"),
      ),
      body: Center(
        child: Column(
          children: [

          ],),
      ),
    );
  }
}