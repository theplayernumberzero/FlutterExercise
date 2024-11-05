// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yemek_uygulamasi/Yemekler.dart';

class DetaySayfa extends StatefulWidget {
  Yemekler yemek;
  
  DetaySayfa({
    Key? key,
    required this.yemek,
  }) : super(key: key);
  

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("${widget.yemek.yemek_adi}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.yemek_resim_adi}"),
            Text("${widget.yemek.yemek_fiyat.toInt()} ₺", style: TextStyle(color: Colors.blue, fontSize: 20),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("SIPARIS VER"),
                onPressed: (){
                  print("${widget.yemek.yemek_adi} tikladi.");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}