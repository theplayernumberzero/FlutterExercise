import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({super.key});

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
              child: Image.asset("resimler/mutlu.png")
              ),
              Text("KAZANDINIZ", style: TextStyle(fontSize: 36),),
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