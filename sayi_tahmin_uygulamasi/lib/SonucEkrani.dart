// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;

  SonucEkrani({
    Key? key,
    required this.sonuc,
  }) : super(key: key);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Sonuc Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: widget.sonuc ? Image.asset("resimler/mutlu.png") : Image.asset("resimler/uzgun.png")
              ),
              Text(widget.sonuc ? "KAZANDINIZ" : "KAYBETTİNİZ", style: TextStyle(fontSize: 36),),
              SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context); //Geri tuşunun işlevini yapar
              
              }, child: Text("TEKRAR DENE")),
            ),
          ],
        ),
      ),
    );
  }
}