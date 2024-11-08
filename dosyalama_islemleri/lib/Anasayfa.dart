import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfGirdi = TextEditingController();

  Future<void> veriYaz() async {
    var ad = await getApplicationDocumentsDirectory(); //Erişim izni al

    var uygulamaYolu = await ad.path; //Dosya yolu al

    var dosya = File("$uygulamaYolu/dosyam.txt"); //Dosya oluştur

    dosya.writeAsString(tfGirdi.text); //Dosyaya veri yaz

    tfGirdi.text = ""; //TextField temizleme
  }

  Future<void> veriOku() async {
    try {
      var ad = await getApplicationDocumentsDirectory(); //Erişim izni al

      var uygulamaYolu = await ad.path; //Dosya yolu al

      var dosya = File("$uygulamaYolu/dosyam.txt"); //Dosya oluştur

      String okunanVeri = await dosya.readAsString(); //Dosya okuma
      tfGirdi.text = okunanVeri;

    } catch (e) {
      e.toString();
    }
  }

  Future<void> veriSil() async {
    var ad = await getApplicationDocumentsDirectory(); //Erişim izni al

    var uygulamaYolu = await ad.path; //Dosya yolu al

    var dosya = File("$uygulamaYolu/dosyam.txt"); //Dosya oluştur

    if(dosya.existsSync()){
      dosya.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dosyalama Islemleri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tfGirdi,
              decoration: const InputDecoration(
                hintText: "Veri giriniz",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {veriYaz();}, child: Text("Yaz")),
                ElevatedButton(onPressed: () {veriOku();}, child: Text("Oku")),
                ElevatedButton(onPressed: () {veriSil();}, child: Text("Sil")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
