import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late Timer zamanlayici;
  int kalanZaman = 0;
  bool visibile_text = false;
  bool visibile_button = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIMER", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: visibile_text,
              child: Text("Kalan zaman: $kalanZaman", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
            Visibility(
              visible: visibile_button,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      kalanZaman = 10;
                      visibile_text=true;
                      visibile_button = false;
                    });
                    zamanlayici = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if(kalanZaman < 1){
                          kalanZaman = 0;
                          visibile_button = true;
                          zamanlayici.cancel();
                        }else{
                          kalanZaman--;
                        }
                      });
                     });
                  }, child: const Text("10 second")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      kalanZaman = 20;
                      visibile_text=true;
                      visibile_button = false;
                    });
                    zamanlayici = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if(kalanZaman < 1){
                          kalanZaman = 0;
                          visibile_button = true;
                          zamanlayici.cancel();
                        }else{
                          kalanZaman--;
                        }
                      });
                     });
                  }, child: const Text("20 second")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      kalanZaman = 30;
                      visibile_text=true;
                      visibile_button = false;
                    });
                    zamanlayici = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if(kalanZaman < 1){
                          kalanZaman = 0;
                          visibile_button = true;
                          zamanlayici.cancel();
                        }else{
                          kalanZaman--;
                        }
                      });
                     });
                  }, child: const Text("30 second")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}