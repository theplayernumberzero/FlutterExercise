import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_kullanimi/SayacModel.dart';

class IkinciSayfa extends StatelessWidget {
  const IkinciSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SayacModel>(
              builder: (context, sayacModelNesnesi, child){
                return Text("${sayacModelNesnesi.sayacOku()}", style: TextStyle(fontSize: 36),);
              },
            ),
            Consumer<SayacModel>(
              builder: (context, sayacModelNesnesi, child){
                return ElevatedButton(onPressed: (){
                  sayacModelNesnesi.sayaciArttir();
                },
                  child: Text("Sayaç arttir"));
              },
            ),
            Consumer<SayacModel>(
              builder: (context, sayacModelNesnesi, child){
                return ElevatedButton(onPressed: (){
                  sayacModelNesnesi.sayaciAzalt(2);
            }, child: Text("Sayaç azalt"));
              },
            ),
          ],
        ),
      ),
    );
  }
}