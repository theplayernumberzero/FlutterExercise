import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animasyonKontrol;

  late Animation<double> alphaAnimasyonDegerleri;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Nesne olarak tanımla
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 3000),vsync: this);

    alphaAnimasyonDegerleri = Tween(begin: 1.0, end: 0.0).animate(animasyonKontrol)..addListener(() {setState(() {});});  //Opacity widget için value üretecek
  }

  //Sayfa arkaplana gittiğinde çalışan yapı
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animasyonKontrol.dispose(); //animasyonKontrol işlemleri durur
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
              opacity: alphaAnimasyonDegerleri.value,
              child: Icon(Icons.wb_cloudy, color: Colors.white, size: 128,)),
            Text("Hava Durumu", style: TextStyle(color: Colors.white, fontSize: 36),),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange) ,
                onPressed: (){
                  animasyonKontrol.forward(); //Animasyonun çalışması için gerekli
              
              }, child: Text("BASLA", style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
          ],
        ),
        ),
    );
  }
}