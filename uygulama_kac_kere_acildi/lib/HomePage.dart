import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int sayac = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kacKereAcildi();
  }

  Future<void> kacKereAcildi() async{
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;

    setState(() {
      sayac++;
    });

    sp.setInt("sayac", sayac);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaç Kere Açıldı?"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Text("Uygulama $sayac kere açıldı.", style: TextStyle(fontSize: 24,),),
      ),
    );
  }
}