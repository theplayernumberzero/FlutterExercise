import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yemek_uygulamasi/DetaySayfa.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(yemek_id: 1, yemek_adi: "Kofte", yemek_resim_adi: "kofte.png", yemek_fiyat: 330.0);
    var y2 = Yemekler(yemek_id: 2, yemek_adi: "Hamburger", yemek_resim_adi: "hamburger.png", yemek_fiyat: 260.0);
    var y3 = Yemekler(yemek_id: 3, yemek_adi: "Iskender", yemek_resim_adi: "iskender.png", yemek_fiyat: 420.0);
    var y4 = Yemekler(yemek_id: 4, yemek_adi: "Kebap", yemek_resim_adi: "kebap.png", yemek_fiyat: 380.0);
    var y5 = Yemekler(yemek_id: 5, yemek_adi: "Makarna", yemek_resim_adi: "makarna.png", yemek_fiyat: 230.0);
    var y6 = Yemekler(yemek_id: 6, yemek_adi: "Patates", yemek_resim_adi: "patates.png", yemek_fiyat: 80.0);
    var y7 = Yemekler(yemek_id: 7, yemek_adi: "Pizza", yemek_resim_adi: "pizza.png", yemek_fiyat: 280.0);
    var y8 = Yemekler(yemek_id: 8, yemek_adi: "Tost", yemek_resim_adi: "tost.png", yemek_fiyat: 55.0);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    yemekListesi.add(y7);
    yemekListesi.add(y8);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Uygulamasi"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var yemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context, index) {
                var yemek = yemekListesi[index];

                return Card(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("resimler/${yemek.yemek_resim_adi}")),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${yemek.yemek_adi}", style: TextStyle(fontSize: 26),),
                            Container(
                              height: 20,
                            ),
                            Text("${yemek.yemek_fiyat.toInt()} ₺", style: TextStyle(fontSize: 20, color: Colors.blue),)
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: yemek)));
                        },
                        child: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                );
              },
            );

          }else{
            return Center(child: Text("Data Gelmedi", style: TextStyle(fontSize: 48),),);
          }
        },
      ),
    );
  }
}