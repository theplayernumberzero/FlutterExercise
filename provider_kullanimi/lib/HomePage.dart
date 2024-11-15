import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_kullanimi/IkinciSayfa.dart';
import 'package:provider_kullanimi/SayacModel.dart';

//Statelessda da kullanılabilir
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Provider ile dinleme işlemini başka sayfadan da yapabiliriz.
            Consumer<SayacModel>(
              builder: (context, sayacModelNesnesi, child){
                return Text("${sayacModelNesnesi.sayacOku()}", style: TextStyle(fontSize: 36),);
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => IkinciSayfa()));
            }, child: Text("Geçiş Yap ->"))
          ],
        ),
      ),
    );
  }
}