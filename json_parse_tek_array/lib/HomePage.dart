import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse_tek_array/Kisiler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void kisilerParse(){
    String strVeri = '{"kisiler" : [{"kisi_id" : 1 , "kisi_ad" : "Bahadir", "kisi_tel": "58"}, {"kisi_id" : 2 , "kisi_ad" : "Umut", "kisi_tel": "34"}]}';

    var jsonVeri = json.decode(strVeri);  //Json verisi haline geldi

    var jsonArray = jsonVeri["kisiler"];  //Valueları aldık

    //Valueları sınıfa gönderdik
    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

    for(var k in kisilerListesi){
      print("*******");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi adi: ${k.kisi_ad}");
      print("Kisi tel: ${k.kisi_tel}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisilerParse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parse - Tek Array"),
      ),
      body: Center(
        child: Column(
          children: [

          ],),
      ),
    );
  }
}