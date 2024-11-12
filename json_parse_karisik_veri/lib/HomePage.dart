import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse_karisik_veri/Kisiler.dart';
import 'package:json_parse_karisik_veri/KisilerCevap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void kisilerCevapParse(){
    String strVeri = '{"success" : 1,"kisiler" : [{"kisi_id" : 1 , "kisi_ad" : "Bahadir", "kisi_tel": "58"}, {"kisi_id" : 2 , "kisi_ad" : "Umut", "kisi_tel": "34"}]}';

    var jsonVeri = json.decode(strVeri);

    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    print("Success : ${kisilerCevap.success}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

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
    kisilerCevapParse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parse - Karisik Veri"),
      ),
      body: Center(
        child: Column(
          children: [

          ],),
      ),
    );
  }
}