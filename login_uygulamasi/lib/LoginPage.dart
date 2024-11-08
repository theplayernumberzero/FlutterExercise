import 'package:flutter/material.dart';
import 'package:login_uygulamasi/Anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  Future<void> girisKontrol() async{
    var ka = tfKullaniciAdi.text;
    var s = tfSifre.text;

    //Geçerli kullanici adi ve şifre
    if(ka == "admin" && s == "12345"){
      var sp = await SharedPreferences.getInstance();

      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", s);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Anasayfa()));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Giriş Hatalı'),));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white,),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  labelText: 'Kullanici Adi',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Kullanici adinizi giriniz...',
                  hintStyle: TextStyle(color: Colors.blueGrey[300]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.blueGrey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(color: Colors.blueGrey[300]!, width: 1.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  suffixIcon: const Icon(Icons.text_fields, color: Colors.blueGrey),
                ),
              ),
              TextField(
                obscureText: true,
                controller: tfSifre,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Şifrenizi giriniz...',
                  hintStyle: TextStyle(color: Colors.blueGrey[300]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.blueGrey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(color: Colors.blueGrey[300]!, width: 1.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  suffixIcon: const Icon(Icons.text_fields, color: Colors.blueGrey),
                ),
              ),
              ElevatedButton(
                child: Text("GİRİŞ YAP"),
                onPressed: () {
                  girisKontrol();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
