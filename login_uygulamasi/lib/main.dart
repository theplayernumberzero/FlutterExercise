import 'package:flutter/material.dart';
import 'package:login_uygulamasi/Anasayfa.dart';
import 'package:login_uygulamasi/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> oturumKontrol() async{
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "kullanici adi yok";
    String spSifre = sp.getString("sifre") ?? "sifre yok";
    
    if(spKullaniciAdi == "admin" && spSifre == "12345"){
      return true;
    }else{
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: oturumKontrol(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            bool gecisIzni = snapshot.data!;
            return gecisIzni ? Anasayfa() : LoginPage();
          }else{  //Veri gelene kadar bos tasarim gozukecek
            return Container();
          }
        },
      ),
    );
  }
}
