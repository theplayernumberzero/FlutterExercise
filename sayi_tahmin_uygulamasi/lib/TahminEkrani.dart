import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String ipucu = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rastgeleSayi = Random().nextInt(101);  //0-100 arasında
    print("Rastgele Sayi: $rastgeleSayi");
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak: $kalanHak", style: TextStyle(fontSize: 30, color: Colors.pink),),
            Text("Yardim: $ipucu !", style: TextStyle(fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  label: Text("Tahmin"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: (){

                  setState(() {
                    kalanHak--;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                    return; //Button çalışmasını durdurmak için
                  }
                  if (tahmin > rastgeleSayi) {
                    setState(() { //Arayüzün güncelleneceği değişikliklerde set state metodunu kullan
                      ipucu = "Tahmini Azalt";
                    });
                    
                  }
                  if (tahmin > rastgeleSayi) {
                    setState(() {
                      ipucu = "Tahmini Arttir";
                    });
                    
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)));
                  }

                  tfTahmin.text = "";

              
              }, child: Text("TAHMİN ET")),
            ),
          ],
        ),
      ),
    );
  }
}