import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Filmler>> filmleriGetir() async{
    
    var filmlerListesi = <Filmler>[];

    var f1 = Filmler(film_id: 1, film_adi: "Arrival", film_resim_adi: "arrival.jpg", film_fiyat: 50.0);
    var f2 = Filmler(film_id: 2, film_adi: "Ayla", film_resim_adi: "ayla.jpg", film_fiyat: 48.0);
    var f3 = Filmler(film_id: 3, film_adi: "Godfather", film_resim_adi: "godfather.jpg", film_fiyat: 150.0);
    var f4 = Filmler(film_id: 4, film_adi: "John Wick", film_resim_adi: "johnWick.jpg", film_fiyat: 100.0);
    var f5 = Filmler(film_id: 5, film_adi: "Life is Beautiful", film_resim_adi: "lifeIsBeautiful.jpg", film_fiyat: 250.0);
    var f6 = Filmler(film_id: 6, film_adi: "Split", film_resim_adi: "split.jpg", film_fiyat: 149.0);
    var f7 = Filmler(film_id: 7, film_adi: "Thor", film_resim_adi: "thor.jpg", film_fiyat: 20.0);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    filmlerListesi.add(f7);

    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler Uygulamasi", style: TextStyle(color: Colors.black  ,),),
        backgroundColor: Color.fromARGB(255, 201, 20, 7)
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: FutureBuilder<List<Filmler>>(
          future: filmleriGetir(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              //Veri gelirse burası çalışır
              var liste = snapshot.data;
        
              return GridView.builder(
                itemCount: liste!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  //İtem düzeni tasarımı tanımladığımız yer
                  crossAxisCount: 2,
                  childAspectRatio: 2 /3.5
                ),
                itemBuilder: (context, index){  //Listedeki her eleman için çalışır(döngü)
                  var film = liste[index];
        
                  return Card(
                    color: const Color.fromARGB(255, 184, 24, 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 180,
                            height: 280,
                            child: Image.asset("resimler/${film.film_resim_adi}")),
                        ),
                        Text(film.film_adi, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat.toInt()} ₺", style: TextStyle(fontSize: 16, ),),  
                      ],
                    ),
                  );
                },
                );
            }else{
              //Veri gelmezse bu gösterilecek
              return Center();
            }
          },
        ),
      ),
    );
  }
}