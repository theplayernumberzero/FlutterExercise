import 'package:flutter/material.dart';
import 'package:login_uygulamasi/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late String spKullaniciAdi;
  late String spSifre;

  Future<void> oturumBilgisiOku() async{
    var sp = await SharedPreferences.getInstance();

    setState(() {
      spKullaniciAdi = sp.getString("kullaniciAdi") ?? "kullanici adi yok";
      spSifre = sp.getString("sifre") ?? "sifre yok";
    });
  }

  Future<void> cikisYap() async{
    var sp = await SharedPreferences.getInstance();

    sp.remove("kullaniciAdi");
    sp.remove("sifre");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oturumBilgisiOku();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
            cikisYap();
          }, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kullanici Adi:\n$spKullaniciAdi",
              style: const TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Font weight
                color: Colors.green, // Text color
                letterSpacing: 2.0, // Spacing between letters
                wordSpacing: 4.0, // Spacing between words
                fontFamily: 'Roboto', // Font family 
                shadows: [
                  Shadow(
                    blurRadius: 5.0, // Blur radius of shadow
                    color: Colors.black, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
              ),
              textAlign:
                  TextAlign.center, // Text alignment (left, center, right)
            ),
            Text(
              "Şifre:\n$spSifre",
              style: const TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Font weight
                color: Colors.green, // Text color
                letterSpacing: 2.0, // Spacing between letters
                wordSpacing: 4.0, // Spacing between words
                fontFamily: 'Roboto', // Font family 
                shadows: [
                  Shadow(
                    blurRadius: 5.0, // Blur radius of shadow
                    color: Colors.black, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
              ),
              textAlign:
                  TextAlign.center, // Text alignment (left, center, right)
            ),
          ],
        ),
      ),
    );
  }
}
