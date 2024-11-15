import 'package:flutter/material.dart';

class SayacModel extends ChangeNotifier{

  int sayac = 0;

  //Sayaç okumak için, dinleme işlemi yapacağımız yerlerde kullanacağız
  int sayacOku(){
    return sayac;
  }

  //Tetikleme işlemi
  void sayaciArttir(){
    sayac++;
    notifyListeners();  //Tetikleme işlemini yapar. Sayfaya sayacOku() çalıştırabilirsin diyoruz.
  }

  void sayaciAzalt(int miktar){
    sayac = sayac - miktar;
    notifyListeners(); 
  }
}